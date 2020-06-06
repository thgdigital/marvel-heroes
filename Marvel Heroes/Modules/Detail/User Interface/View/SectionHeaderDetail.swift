//
//  SectionHeaderDetail.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 03/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit
import Hero

class SectionHeaderDetail: Sections {

    override func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        DetailHeaderCell.self
    }
    
    override func getCellSize(_ cell: CollectionViewCell.Type, for indexPath: IndexPath) -> CGSize {
        .init(width: UIScreen.main.bounds.width, height: 400)
    }
    
    override func willDisplayCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {
        guard let cell = cell as? DetailHeaderCell, let item = items[indexPath.row] as? ItemHederDetail else {
            return
        }
        cell.configure(item: item)
    }
}
