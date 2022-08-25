//
//  MoreCatInfoViewController.swift
//  GatinhoInfo
//
//  Created by Inpeaceapp on 23/08/2022.
//  Copyright © 2022 Amanda. All rights reserved.
//

import UIKit

class MoreCatInfoViewController: UIViewController {

    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var breedName: UILabel!
    @IBOutlet weak var breedTemperament: UILabel!
    @IBOutlet weak var breedDescription: UILabel!
    
    var breed:BreedInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false;
        
        guard let safeBreed = breed else {
            return
        }
        breedName.text = safeBreed.name
        breedTemperament.text = safeBreed.temperament
        breedDescription.text = safeBreed.description
        
        guard let image = safeBreed.image, let imageUrl = image.url else {
            return
        }
        catImage.loadFrom(URLAddress:imageUrl)
        
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
