//
//  MoreCatInfoViewController.swift
//  GatinhoInfo
//
//  Created by Inpeaceapp on 23/08/2022.
//  Copyright © 2022 Amanda. All rights reserved.
//

import UIKit

class MoreCatInfoViewController: UIViewController {

    var breed:BreedInfo?
    
    private lazy var catImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var breedName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.layer.masksToBounds = true
        return label
    }()
    
    private lazy var breedTemperament: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var breedDescription: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.spacing = 25.0
        view.distribution = .equalSpacing
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
    }
    
    func setupComponents() {
        
        view.backgroundColor = #colorLiteral(red: 0.662745098, green: 0.8705882353, blue: 0.9764705882, alpha: 1)
        navigationController?.navigationBar.barTintColor =  #colorLiteral(red: 0.662745098, green: 0.8705882353, blue: 0.9764705882, alpha: 1)
        
        stackView.addArrangedSubview(breedName)
        stackView.addArrangedSubview(breedTemperament)
        stackView.addArrangedSubview(breedDescription)
        stackView.addArrangedSubview(catImage)
        view.addSubview(stackView)
        
        setupBreedInfo()
        setupImageConstraints()
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
    }
    
    private func setupBreedInfo(){
        guard let safeBreed = breed,
            let image = safeBreed.image,
            let imageUrl = image.url else {
                return
        }
        
        catImage.loadFrom(URLAddress:imageUrl)
        breedName.text = safeBreed.name
        breedTemperament.text = safeBreed.temperament
        breedDescription.text = safeBreed.description

    }
    
    private func setupImageConstraints(){
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
