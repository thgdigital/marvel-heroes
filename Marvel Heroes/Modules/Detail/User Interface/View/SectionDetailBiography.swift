//
//  SectionDetailBiography.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 04/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class SectionDetailBiography: Sections {
    
    override func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        BiographyCell.self
    }
    override func cellWidth(collectionWidth: CGFloat) -> CGFloat {
        UIScreen.main.bounds.width - 48
    }
    
    override func willDisplayCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {
        guard let cell = cell as? BiographyCell, let item = items[indexPath.row] as? BiographyItem else {
            return
        }
        
        cell.configure(text: item.text)
    }
}
