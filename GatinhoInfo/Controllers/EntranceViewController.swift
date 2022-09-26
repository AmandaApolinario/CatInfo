//
//  ViewController.swift
//  GatinhoInfo
//
//  Created by Inpeaceapp on 13/08/2022.
//  Copyright © 2022 Amanda. All rights reserved.
//

import UIKit

class EntranceViewController: UIViewController {

    private lazy var labelName: UILabel = {
        let label = UILabel()
      label.text = NSLocalizedString("AppName", comment: "")
        label.textAlignment = .center
        label.textColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
      label.font = UIFont(name: NSLocalizedString("EntranceFont", comment: "") , size: 50)
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        return label
    }()
    
    private lazy var checkCatsButton: UIButton = {
        let button = UIButton()
      button.setTitle(NSLocalizedString("EntranceButtonText", comment: ""), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.titleLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
      button.titleLabel?.font = UIFont(name: NSLocalizedString("EntranceButtonText", comment: "") , size: 25)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var catDrawing: UIImageView = UIImageView(image:#imageLiteral(resourceName: "catDrawingImage"))
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 50.0
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

        stackView.addArrangedSubview(labelName)
        stackView.addArrangedSubview(catDrawing)
        stackView.addArrangedSubview(checkCatsButton)
        
        view.addSubview(stackView)
        
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
        let viewModel:FindBreeds = TableViewModel()
        
        let vc = TableViewController(viewModel: viewModel)
        navigationController?.pushViewController(vc, animated: true)
    }

}
