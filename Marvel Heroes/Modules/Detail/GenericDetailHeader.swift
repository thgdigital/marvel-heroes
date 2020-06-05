//
//  GenericDetailHeader.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 05/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import LBTATools

class GenericDetailHeader: CollectionViewHeader {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = .sectionTitle
        titleLabel.textColor = .white
        
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
}
