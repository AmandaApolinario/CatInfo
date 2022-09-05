//
//  ViewController.swift
//  GatinhoInfo
//
//  Created by Inpeaceapp on 13/08/2022.
//  Copyright © 2022 Amanda. All rights reserved.
//

import UIKit
import Alamofire

class EntranceViewController: UIViewController {
   
    let labelName = UILabel()
    let checkCatsButton = UIButton()
    let catDrawing = UIImageView(image:#imageLiteral(resourceName: "catDrawingImage"))
    let stackView = UIStackView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.662745098, green: 0.8705882353, blue: 0.9764705882, alpha: 1)
        
        labelName.text = "CatInfo"
        labelName.textAlignment = .center
        labelName.textColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        labelName.font = UIFont(name: "AppleSDGothicNeo-Bold" , size: 50)
        labelName.layer.cornerRadius = 10
        labelName.layer.masksToBounds = true
        
        checkCatsButton.setTitle("Check Cats", for: .normal)
        checkCatsButton.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        checkCatsButton.titleLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        checkCatsButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold" , size: 25)
        checkCatsButton.layer.cornerRadius = 5
        checkCatsButton.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(labelName)
        stackView.addArrangedSubview(catDrawing)
        stackView.addArrangedSubview(checkCatsButton)
        stackView.axis = .vertical
        stackView.spacing = 50.0
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @objc func buttonClicked(sender: UIButton){
        let vc = TableViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}
