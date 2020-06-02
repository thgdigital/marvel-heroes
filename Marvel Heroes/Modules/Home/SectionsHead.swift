//
//  SectionsHead.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 02/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class SectionsHead: Sections {
    
    override func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        HeadChangeCharacterCell.self
    }
    override func getCellSize(_ cell: CollectionViewCell.Type, for indexPath: IndexPath) -> CGSize {
        .init(width: UIScreen.main.bounds.width, height: 340)
    }
    
}
