//
//  Extensions.swift
//  GatinhoInfo
//
//  Created by Amanda Brito Apolinário on 23/09/22.
//  Copyright © 2022 Amanda. All rights reserved.
//

import UIKit

extension UIImageView {

  func loadFrom(URLAddress: String) {
    guard let url = URL(string: URLAddress) else {
      return
    }

    DispatchQueue.global(qos: .userInitiated).async(){
      if let imageData = try? Data(contentsOf: url) {
        DispatchQueue.main.async { [weak self] in
          if let loadedImage = UIImage(data: imageData) {
            self?.image = loadedImage
          }
        }
      }
    }
  }
}
