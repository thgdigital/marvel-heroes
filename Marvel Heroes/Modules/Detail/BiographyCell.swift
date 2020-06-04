//
//  BiographyCell.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 04/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class BiographyCell: CollectionViewCell {
    @IBOutlet weak var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textLabel.font = .descriptionTitle
        textLabel.textColor = .primaryGray
    }

}
