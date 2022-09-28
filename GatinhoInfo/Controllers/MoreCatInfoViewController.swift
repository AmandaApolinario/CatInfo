//
//  MoreCatInfoViewController.swift
//  GatinhoInfo
//
//  Created by Inpeaceapp on 23/08/2022.
//  Copyright © 2022 Amanda. All rights reserved.
//

import UIKit

class MoreCatInfoViewController: UIViewController {

    var breed: BreedInfo?

  private lazy var animalView: AnimalView = {
    let view = AnimalView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupBreedInfo()
    view.addSubview(animalView)
    setupComponents()
  }

  func setupComponents() {

    view.backgroundColor = #colorLiteral(red: 0.662745098, green: 0.8705882353, blue: 0.9764705882, alpha: 1)
    navigationController?.navigationBar.barTintColor =  #colorLiteral(red: 0.662745098, green: 0.8705882353, blue: 0.9764705882, alpha: 1)

    NSLayoutConstraint.activate([
      animalView.topAnchor.constraint(equalTo: view.topAnchor),
      animalView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      animalView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      animalView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])

  }

  private func setupBreedInfo() {
    guard let safeBreed = breed,
          let image = safeBreed.image,
          let imageUrl = image.url else {
      return
    }

    guard let name = safeBreed.name, let description = safeBreed.description, let temperament = safeBreed.temperament else {
      return
    }
    animalView.configure(name: name, description: description, temperament: temperament, image: imageUrl)
  }

}
