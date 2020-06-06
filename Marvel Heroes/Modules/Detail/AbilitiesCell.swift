//
//  AbilitiesCell.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 05/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit


class AbilitiesCell: CollectionViewCell {
    
    var item: AbilitiesItem = AbilitiesItem(name: "", abilitie: 0)
    
    let titleLabel: UILabel = UILabel(text: "Força", font: .abilityTitle, textColor: .primaryGray, textAlignment: .left, numberOfLines: 0)
    
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.backgroundColor = .clear
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.identifier)
        hstack(titleLabel, collectionView)
    }
    
    
    func configure(item: AbilitiesItem){
        self.item = item
        titleLabel.text = item.name
        collectionView.reloadData()
    }
    
}


extension AbilitiesCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.identifier, for: indexPath)
        if (indexPath.row + 1 ) <= item.maximum {
            cell.backgroundColor = .white
        }else{
            cell.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        }
        
     
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var height = 0
        if (indexPath.row + 1 ) == item.maximum {
            height = 10
        } else {
            height = 8
        }
        
        return .init(width: 3, height: height)
        
    }
    
}
