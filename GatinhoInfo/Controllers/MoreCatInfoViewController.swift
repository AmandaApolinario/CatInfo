//
//  MoreCatInfoViewController.swift
//  GatinhoInfo
//
//  Created by Inpeaceapp on 23/08/2022.
//  Copyright © 2022 Amanda. All rights reserved.
//

import UIKit

class MoreCatInfoViewController: UIViewController {

    var catImage = UIImageView()
    var breedName = UILabel()
    var breedTemperament = UILabel()
    var breedDescription = UILabel()
    let stackView = UIStackView()
    
    var breed:BreedInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.662745098, green: 0.8705882353, blue: 0.9764705882, alpha: 1)
        navigationController?.navigationBar.barTintColor =  #colorLiteral(red: 0.662745098, green: 0.8705882353, blue: 0.9764705882, alpha: 1)
//        self.navigationController?.navigationBar.isHidden = false;
//
        guard let safeBreed = breed else {
            return
        }
        breedName.text = safeBreed.name
        breedName.textAlignment = .center
        breedName.layer.masksToBounds = true
        
        breedTemperament.text = safeBreed.temperament
        breedTemperament.textAlignment = .center
        breedTemperament.layer.masksToBounds = true
        breedTemperament.numberOfLines = 0
        
        breedDescription.text = safeBreed.description
        breedDescription.textAlignment = .center
        breedDescription.layer.masksToBounds = true
        breedDescription.numberOfLines = 0
        
        guard let image = safeBreed.image, let imageUrl = image.url else {
            return
        }
        catImage.loadFrom(URLAddress:imageUrl)
        catImage.contentMode = .scaleAspectFit
        
    
        stackView.addArrangedSubview(breedName)
        stackView.addArrangedSubview(breedTemperament)
        stackView.addArrangedSubview(breedDescription)
        stackView.addArrangedSubview(catImage)
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 25.0
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        NSLayoutConstraint.activate([
            catImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            catImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            catImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            catImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32)
            ])
        
    }

}

extension UIImageView {
    
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self?.image = loadedImage
                }
            }
        }
    }
}
