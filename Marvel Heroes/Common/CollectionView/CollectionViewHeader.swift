//
//  CollectionViewHeader.swift
//  GloboMais
//
//  Created by THIAGO on 16/07/19.
//  Copyright © 2019 Editora Globo. All rights reserved.
//

import UIKit

class CollectionViewHeader: UICollectionReusableView {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class func fromNib() -> CollectionViewHeader? {
        return UINib(nibName: identifier, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? CollectionViewHeader
    }
}
