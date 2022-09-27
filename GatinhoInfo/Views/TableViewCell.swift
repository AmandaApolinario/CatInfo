//
//  TableViewCell.swift
//  GatinhoInfo
//
//  Created by Amanda Brito Apolinário on 20/09/22.
//  Copyright © 2022 Amanda. All rights reserved.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {

  private lazy var animalCell: AnimalView = {
    let animalView = AnimalView()
    animalView.translatesAutoresizingMaskIntoConstraints = false
    return animalView
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  
    addSubview(animalCell)
    setContraints()
  }

  required init?(coder: NSCoder) {
    fatalError(NSLocalizedString("InitNotImplemented", comment: ""))
  }

    func setup(name: String) {
      animalCell.configure(name:name, description: "", temperament: "",image: "")
    }

  func setContraints(){
    NSLayoutConstraint.activate([
      animalCell.topAnchor.constraint(equalTo: topAnchor),
      animalCell.leadingAnchor.constraint(equalTo: leadingAnchor),
      animalCell.trailingAnchor.constraint(equalTo: trailingAnchor),
      animalCell.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }

}
