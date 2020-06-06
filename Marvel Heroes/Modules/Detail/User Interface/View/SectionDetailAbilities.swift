//
//  SectionDetailAbilities.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 05/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit


class SectionDetailAbilities: Sections {
    
    override func header() -> CollectionViewHeader.Type? {
        GenericDetailHeader.self
    }
    
    override func willDisplayHeader(_ headerView: CollectionViewHeader) {
        if let header = headerView as? GenericDetailHeader {
            header.configure(title: name)
        }
    }
    
    override func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        AbilitiesCell.self
    }
    
    override func getCellSize(_ cell: CollectionViewCell.Type, for indexPath: IndexPath) -> CGSize {
        .init(width: UIScreen.main.bounds.width - 48, height: 12)
    }
    
    override func willDisplayCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {
         guard let cell = cell as? AbilitiesCell, let item = items[indexPath.row] as? AbilitiesItem else {
                   return
               }
        cell.configure(item: item)
    }
    
    override func cellLineSpace(collectionWidth: CGFloat) -> CGFloat {
        20
    }
}

