//
//  TableViewModel.swift
//  GatinhoInfo
//
//  Created by Inpeaceapp on 30/08/2022.
//  Copyright © 2022 Amanda. All rights reserved.
//

import Foundation

protocol FindBreeds {
    var itemCount: Int { get }
    
    func itemSelected(_ index: Int) -> BreedInfo
    func itemForTableView(_ indexPath: IndexPath) -> String
    func fetchBreeds(completion: @escaping (Bool) -> Void)
}

class TableViewModel: FindBreeds {
    
    var catsInfo:[BreedInfo] = []
  let urlString = NSLocalizedString("UrlDaAPI", comment: "")
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
      let url = URL(string: urlString)
      guard let requestUrl = url else { fatalError() }

      var request = URLRequest(url: requestUrl)
      request.httpMethod = NSLocalizedString("get", comment: "")

      let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

          if let error = error {
            print(NSLocalizedString("RequestError", comment: "") + "\(error)")
              return
          }

          guard let data = data else {
            return
          }

          do{
              let breedInfo = try decoder.decode([BreedInfo].self, from: data)
              self.catsInfo = breedInfo

              completion(true)
          }
        
          catch let ex {
              print(ex.localizedDescription)
              completion(false)
          }
      }
      task.resume()

    }
}
