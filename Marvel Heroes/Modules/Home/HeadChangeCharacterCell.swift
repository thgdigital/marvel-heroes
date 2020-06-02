//
//  HeadChangeCharacterCell.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 02/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class HeadChangeCharacterCell: CollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        descriptionLabel.textColor = .primaryGray
        descriptionLabel.font = .homeSubTitle
        titleLabel.font = .homeTitle
    }

}
