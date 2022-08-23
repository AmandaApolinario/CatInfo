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
    
    var name:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        breedName.text = name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
