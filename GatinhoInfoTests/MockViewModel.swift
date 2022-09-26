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

  var breedsInfo:[BreedInfo] = []

  var itemCount: Int {
    return self.breedsInfo.count
  }

  func itemSelected(_ index: Int) -> BreedInfo {
    return breedsInfo[index]
  }

  func itemForTableView(_ indexPath: IndexPath) -> String {
    guard let name = breedsInfo[indexPath.row].name else{
      return ""
    }
    return name
  }

  func fetchBreeds(completion: @escaping (Bool) -> Void) {
    breedsInfo = [BreedInfo(name: "cat 1", description: "description 1", temperament: "temperament 1",              image: Image(url:"")),
                  BreedInfo(name: "cat 2", description: "description 2", temperament: "temperament 2", image:  Image(url:"")),
                  BreedInfo(name: "cat 3", description: "description 3", temperament: "temperament 3", image:  Image(url:"")),
                  BreedInfo(name: "Bulldog", description: "You can't mistake a Bulldog for any other breed. The loose skin of the head, furrowed brow, pushed-in nose, small ears, undershot jaw with hanging chops on either side, and the distinctive rolling gait all practically scream 'I'm a Bulldog!'", temperament: "friendly/courageous/calm",image: Image(url:"")),
                  BreedInfo(name: "Golden Retriever", description: "The Golden Retriever, an exuberant Scottish gundog of great beauty, stands among America's most popular dog breeds. They are serious workers at hunting and field work, as guides for the blind, and in search-and-rescue, enjoy obedience and other competitive events, and have an endearing love of life when not at work. ", temperament: "intelligent/friendly/devoted", image:  Image(url:"")),
                  BreedInfo(name: "Chow Chow", description: "The Chow Chow, an all-purpose dog of ancient China, presents the picture of a muscular, deep-chested aristocrat with an air of inscrutable timelessness. Dignified, serious-minded, and aloof, the Chow Chow is a breed of unique delights. ", temperament: "dignified/bright/serious-minded", image:  Image(url:""))]
      completion(true)
  }
}
