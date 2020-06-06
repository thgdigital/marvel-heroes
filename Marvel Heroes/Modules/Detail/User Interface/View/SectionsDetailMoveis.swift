//
//  SectionsDetailMoveis.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 05/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class SectionsDetailMoveis: Sections {
    
    override func direction() -> UICollectionView.ScrollDirection {
        .horizontal
    }
    
    override func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        BoxMoviesCell.self
    }
    
    override func willDisplayCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {
        guard let cell = cell as? BoxMoviesCell, let items = items as? [MoviesItem] else {
            return
        }
        
        cell.items = items
    }
    
    override func getCellSize(_ cell: CollectionViewCell.Type, for indexPath: IndexPath) -> CGSize {
        .init(width: UIScreen.main.bounds.width - 48, height: 235)
    }
    
    override func header() -> CollectionViewHeader.Type? {
        GenericDetailHeader.self
    }
    
    override func willDisplayHeader(_ headerView: CollectionViewHeader) {
        if let header = headerView as? GenericDetailHeader {
            header.configure(title: name)
        }
    }
}
