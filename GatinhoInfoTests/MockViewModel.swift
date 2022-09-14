//
//  MockViewModel.swift
//  GatinhoInfoTests
//
//  Created by Inpeaceapp on 12/09/2022.
//  Copyright © 2022 Amanda. All rights reserved.
//

import Foundation
@testable import GatinhoInfo

class MockViewModel:FindBreeds {
    
    var catsInfo:[BreedInfo] = []
    var reloadHandler: DataHandler = { }
    
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
        catsInfo = [BreedInfo(name: "cat 1", description: "description 1", temperament: "temperament 1",              image: Image(url:"")),
                    BreedInfo(name: "cat 2", description: "description 2", temperament: "temperament 2", image:  Image(url:"")),
                    BreedInfo(name: "cat 3", description: "description 3", temperament: "temperament 3", image:  Image(url:""))]
    }
}
