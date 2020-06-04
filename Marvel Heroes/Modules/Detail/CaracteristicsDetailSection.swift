//
//  CaracteristicsDetailSection.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 03/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class CaracteristicsDetailSection: Sections {
    
    
    override func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        CaracteristicsCell.self
    }
    override func getCellSize(_ cell: CollectionViewCell.Type, for indexPath: IndexPath) -> CGSize {
        .init(width: UIScreen.main.bounds.width - 48, height: 60)
    }
    

}
