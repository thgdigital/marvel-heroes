//
//  CollectionViewFooter.swift
//  GloboMais
//
//  Created by THIAGO on 17/07/19.
//  Copyright © 2019 Editora Globo. All rights reserved.
//

import UIKit

class CollectionViewFooter: UICollectionReusableView {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func fromNib() -> CollectionViewFooter? {
        return UINib(nibName: identifier, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? CollectionViewFooter
    }
}
