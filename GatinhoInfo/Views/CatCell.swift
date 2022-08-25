//
//  CatCell.swift
//  GatinhoInfo
//
//  Created by Inpeaceapp on 19/08/2022.
//  Copyright © 2022 Amanda. All rights reserved.
//

import UIKit

class CatCell: UITableViewCell {

    @IBOutlet weak var viewBreed: UIView!
    @IBOutlet weak var breedLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
