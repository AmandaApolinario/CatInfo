//
//  catCellTableViewCell.swift
//  GatinhoInfo
//
//  Created by Inpeaceapp on 01/09/2022.
//  Copyright © 2022 Amanda. All rights reserved.
//

import UIKit

class AnimalView: UIView {

  private var animalView:UIView = UIView()

  private lazy var breedName: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.layer.masksToBounds = true
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    label.lineBreakMode = .byWordWrapping
    return label
  }()

  private lazy var breedDescription: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.layer.masksToBounds = true
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    label.lineBreakMode = .byWordWrapping
    return label
  }()

  private lazy var breedTemperament: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.layer.masksToBounds = true
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    label.lineBreakMode = .byWordWrapping
    return label
  }()

  private lazy var breedImage: UIImageView = {
    let image = UIImageView()
    image.contentMode = .scaleAspectFit
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()

  private lazy var stackView: UIStackView = {
    let view = UIStackView()
    view.axis = .vertical
    view.spacing = 25.0
    view.translatesAutoresizingMaskIntoConstraints = false
    view.alignment = .center
    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupComponents()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configure(name: String, description: String? = nil, temperament: String? = nil, image: String? = nil) {
    breedName.text = name
    breedDescription.text = description
    breedTemperament.text = temperament
    guard let image = image else {
      return
    }
    breedImage.loadFrom(URLAddress:image)
    
  }

  func setupComponents() {

    stackView.addArrangedSubview(breedName)
    stackView.addArrangedSubview(breedTemperament)
    stackView.addArrangedSubview(breedDescription)
    stackView.addArrangedSubview(breedImage)

    animalView.addSubview(stackView)
    addSubview(animalView)

    setupContraints()
  }

  func setupContraints(){
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor),

      breedImage.centerXAnchor.constraint(equalTo: centerXAnchor),
      breedImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
      breedImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
      breedImage.bottomAnchor.constraint(equalTo:stackView.safeAreaLayoutGuide.bottomAnchor, constant: -32)
    ])
  }
  
}
