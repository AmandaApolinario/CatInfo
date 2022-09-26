//
//  Constants.swift
//  GatinhoInfo
//
//  Created by Amanda Brito Apolinário on 26/09/22.
//  Copyright © 2022 Amanda. All rights reserved.
//

import Foundation

struct Contants{
  static let appName = "CatInfo"
  static let entranceButtonText = "Check Cats"
  static let entranceFont = "AppleSDGothicNeo-Bold"
  static let urlDaAPI = "https://api.thecatapi.com/v1/breeds"
  static let animalCellIdentifier = "animalCellIdentifier"

  struct HTTPMethods{
    static let get = "GET"
    static let post = "POST"
    static let put = "PUT"
    static let delete = "DELETE"
  }

  struct errorMessages{
    static let requestError = "Erro na requisição:"
    static let initNotImplemented = "init(coder:) has not been implemented"
  }

}
