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

class TableViewModel {
    
    var catsInfo:[BreedInfo] = []
    var reloadHandler: DataHandler = { }
    let url = "https://api.thecatapi.com/v1/breeds"
    
    var itemCount: Int {
        return self.catsInfo.count
    }
    
    func itemSelected(_ index: Int) -> BreedInfo {
        return self.catsInfo[index]
    }
    
    func item(_ indexPath: IndexPath) -> String {
        guard let name = self.catsInfo[indexPath.row].name else{
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
