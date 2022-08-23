//
//  BreedInfo.swift
//  GatinhoInfo
//
//  Created by Inpeaceapp on 13/08/2022.
//  Copyright © 2022 Amanda. All rights reserved.
//

import Foundation

struct BreedInfo: Codable{
    let name: String?
    let description: String?
    let temperament: String?
    let image: Image?
}

struct Image: Codable{
    let url: String?
}
