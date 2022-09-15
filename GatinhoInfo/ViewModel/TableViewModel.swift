//
//  TableViewModel.swift
//  GatinhoInfo
//
//  Created by Inpeaceapp on 30/08/2022.
//  Copyright © 2022 Amanda. All rights reserved.
//

import Foundation
import Alamofire

protocol FindBreeds {
    var itemCount: Int { get }
    
    func itemSelected(_ index: Int) -> BreedInfo
    func itemForTableView(_ indexPath: IndexPath) -> String
    func fetchBreeds(completion: @escaping (Bool) -> Void)
}

class TableViewModel: FindBreeds {
    
    var catsInfo:[BreedInfo] = []
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
    
    func fetchBreeds(completion: @escaping (Bool) -> Void) {
        let decoder = JSONDecoder()
        
        let request = Alamofire.request(url)
        
        
        request.responseJSON { data in
            
            guard let dataObj = data.data else {
                return
            }
            do{
                let breedInfo = try decoder.decode([BreedInfo].self, from: dataObj)
                self.catsInfo = breedInfo
                
                completion(true)
            }
            catch let ex {
                print(ex.localizedDescription)
                completion(false)
            }
        }
    }
}
