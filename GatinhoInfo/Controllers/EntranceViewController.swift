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
   
    @IBOutlet weak var checkButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkButton.layer.cornerRadius = 20
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func CheckCatsButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToTableView", sender: self)
    }
}
