//
//  CaracteristicsDetailSection.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 03/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class CaracteristicsDetailSection: Sections {
    
    override func direction() -> UICollectionView.ScrollDirection {
        .horizontal
    }
    
    override func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        BoxCaracteristicsCell.self
    }
    override func getCellSize(_ cell: CollectionViewCell.Type, for indexPath: IndexPath) -> CGSize {
        .init(width: UIScreen.main.bounds.width , height: 60)
    }
    
    override func willDisplayCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {
        
        guard let cell = cell as? BoxCaracteristicsCell, let items = items as? [CaracteristicsItem] else {
            return
        }
        
        cell.items = items
    }
    

}

class CaracteristicsCell: CollectionViewCell {
    
    let imageView = UIImageView(image: UIImage(named: "Age"))
    let labelCaracterist = UILabel(text: "text", font: .caracteristicTitle, textColor: .primaryGray, numberOfLines: 0)
    
    func configure(item: CaracteristicsItem) {
        imageView.image = UIImage(named: item.image)
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .primaryGray
        labelCaracterist.text = item.text
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.contentMode = .scaleAspectFill
        stack(imageView, labelCaracterist, spacing: 4, alignment: .center)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
