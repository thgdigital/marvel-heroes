//
//  CollectionViewCell.swift
//  GloboMais
//
//  Created by THIAGO on 13/06/19.
//  Copyright © 2019 Editora Globo. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    weak var cellDelegate: CollectionViewCellDelegate?
    
    @IBOutlet weak var cellWidthConstraint: NSLayoutConstraint?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func fromNib() -> CollectionViewCell? {
        return UINib(nibName: identifier, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? CollectionViewCell
    }
}

protocol CollectionViewCellDelegate: class {
//    func checkedCode(with data: Data, statusCode: Int, error: NetworkError)
    func error(error: Error?)
    func reloadSections(with localArticleUri: String?)
}
