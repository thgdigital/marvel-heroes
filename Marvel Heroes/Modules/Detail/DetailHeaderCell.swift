//
//  DetailHeaderCell.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 03/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class DetailHeaderCell: CollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var alterEgoLabel: UILabel!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.textColor = .white
        titleLabel.font = .profileTitle
        alterEgoLabel.font = .profileSubTitle
        alterEgoLabel.textColor = .primaryGray
    }

}
