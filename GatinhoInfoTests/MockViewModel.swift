//
//  MockViewModel.swift
//  GatinhoInfoTests
//
//  Created by Inpeaceapp on 12/09/2022.
//  Copyright © 2022 Amanda. All rights reserved.
//

import Foundation
@testable import GatinhoInfo

class MockViewModel: FindBreeds {

  var breedsInfo: [BreedInfo] = []

  var itemCount: Int {
    return self.breedsInfo.count
  }

  func itemSelected(_ index: Int) -> BreedInfo {
    return breedsInfo[index]
  }

  func itemForTableView(_ indexPath: IndexPath) -> String {
    guard let name = breedsInfo[indexPath.row].name else {
      return ""
    }
    return name
  }

  func fetchBreeds(completion: @escaping (Bool) -> Void) {
    breedsInfo = [
      BreedInfo(name: "cat 1", description: "description 1",
                temperament: "temperament 1", image: Image(url: "")),
      BreedInfo(name: "cat 2", description: "description 2",
                temperament: "temperament 2", image: Image(url: "")),
      BreedInfo(name: "cat 3", description: "description 3",
                temperament: "temperament 3", image: Image(url: "")),
      BreedInfo(name: "Bulldog", description: "You can't mistake a Bulldog for any other breed.",
                temperament: "friendly/courageous/calm", image: Image(url: "")),
      BreedInfo(name: "Golden Retriever", description: "The Golden Retriever is America's most popular dog breed.",
                temperament: "intelligent/friendly", image: Image(url: "")),
      BreedInfo(name: "Chow Chow", description: "The Chow Chow, an all-purpose dog of ancient China",
                temperament: "dignified/bright/serious-minded", image: Image(url: ""))]
    completion(true)
  }
}
