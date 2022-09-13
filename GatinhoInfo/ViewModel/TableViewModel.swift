//
//  TableViewModel.swift
//  GatinhoInfo
//
//  Created by Inpeaceapp on 30/08/2022.
//  Copyright © 2022 Amanda. All rights reserved.
//

import Foundation
import Alamofire

typealias DataHandler = () -> Void

protocol FindBreeds {
    var reloadHandler: DataHandler { get set }
    var itemCount: Int { get }
    
    func itemSelected(_ index: Int) -> BreedInfo
    func itemForTableView(_ indexPath: IndexPath) -> String
    func fetchBreeds()
}

class TableViewModel: FindBreeds {
    
    var catsInfo:[BreedInfo] = []
    var reloadHandler: DataHandler = { }
    let url = "https://api.thecatapi.com/v1/breeds"
    
    var itemCount: Int {
        return self.catsInfo.count
    }
    
    func itemSelected(_ index: Int) -> BreedInfo {
        return catsInfo[index]
    }
    
    func itemForTableView(_ indexPath: IndexPath) -> String {
        guard let name = catsInfo[indexPath.row].name else{
            return ""
        }
        return name
    }
    
    func fetchBreeds() {
        let decoder = JSONDecoder()
        
        let request = Alamofire.request(url)
        
        request.responseJSON { data in
            
            guard let dataObj = data.data else {
                return
            }
            do{
                let breedInfo = try decoder.decode([BreedInfo].self, from: dataObj)
                self.catsInfo = breedInfo
                
                self.reloadHandler()
            }
            catch let ex {
                print(ex.localizedDescription)
            }
        }
    }
}
