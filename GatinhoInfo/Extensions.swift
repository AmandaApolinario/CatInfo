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

    DispatchQueue.global(qos: .userInitiated).async {
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

extension StringsEnum {
  func localize(tableName: String? = nil, bundle: Bundle = Bundle.main, comment: String = "") -> String {
    let str = self.rawValue
    return NSLocalizedString(
      str,
      tableName: tableName,
      bundle: bundle,
      value: "",
      comment: comment)
  }
}
