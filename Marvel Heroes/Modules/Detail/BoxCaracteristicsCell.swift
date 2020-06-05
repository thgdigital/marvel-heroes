//
//  CaracteristicsCell.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 03/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import LBTATools

class BoxCaracteristicsCell: CollectionViewCell {
    
    var items: [CaracteristicsItem] = []
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.register(CaracteristicsCell.self, forCellWithReuseIdentifier: CaracteristicsCell.identifier)
        }
    }
}

extension BoxCaracteristicsCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CaracteristicsCell.identifier, for: indexPath) as! CaracteristicsCell
        cell.configure(item: items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Int(UIScreen.main.bounds.width) / items.count - 10
        return .init(width: width, height: 60)
    }
    
}
