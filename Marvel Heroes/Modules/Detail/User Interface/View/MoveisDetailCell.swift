//
//  MoveisDetailCell.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 05/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class MoveisDetailCell: UICollectionViewCell {
    
    @IBOutlet weak var moveiImageView: UIImageView!
    
    func configure(image: String){
        moveiImageView.image = UIImage(named: image)
    }

}
