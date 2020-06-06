//
//  HereosHeader.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 02/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class HereosHeader: CollectionViewHeader {

    @IBOutlet weak var buttonAll: UIButton!
    @IBOutlet weak var titlleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titlleLabel.font = .sectionTitle
        titlleLabel.textColor  = .primaryRed
        buttonAll.titleLabel?.font = .descriptionTitle
        buttonAll.tintColor = .primaryGray
    }
    
    func configure(name: String) {
        titlleLabel.text = name
    }
}
