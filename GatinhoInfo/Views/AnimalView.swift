//
//  catCellTableViewCell.swift
//  GatinhoInfo
//
//  Created by Inpeaceapp on 01/09/2022.
//  Copyright © 2022 Amanda. All rights reserved.
//

import UIKit

class AnimalView: UIView {

  private var animalView: UIScrollView = {
    let view = UIScrollView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.showsVerticalScrollIndicator = false
    view.showsHorizontalScrollIndicator = false
    return view
  }()

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
    fatalError(StringsEnum.InitNotImplemented.rawValue.localize())
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
      stackView.topAnchor.constraint(equalTo: animalView.topAnchor),
      stackView.leadingAnchor.constraint(equalTo: animalView.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: animalView.trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: animalView.bottomAnchor),
      stackView.widthAnchor.constraint(equalTo: animalView.widthAnchor),
      stackView.centerXAnchor.constraint(equalTo: animalView.centerXAnchor),

      breedImage.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
      breedImage.heightAnchor.constraint(equalToConstant: 200),
      breedImage.widthAnchor.constraint(equalToConstant: 220),
      breedImage.bottomAnchor.constraint(equalTo:stackView.safeAreaLayoutGuide.bottomAnchor, constant: -32),

      animalView.topAnchor.constraint(equalTo: topAnchor),
      animalView.bottomAnchor.constraint(equalTo: bottomAnchor),
      animalView.widthAnchor.constraint(equalTo: widthAnchor),
      animalView.centerXAnchor.constraint(equalTo: centerXAnchor),

    ])
  }

}
