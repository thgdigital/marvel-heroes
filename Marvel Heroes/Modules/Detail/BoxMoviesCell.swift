//
//  BoxMoviesCell.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 05/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class BoxMoviesCell: CollectionViewCell {
    
     var items: [MoviesItem] = []{
           didSet {
               collectionView.reloadData()
           }
       }
    
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
            let nibName = UINib(nibName: MoveisDetailCell.identifier, bundle: nil)
            collectionView.register(nibName, forCellWithReuseIdentifier: MoveisDetailCell.identifier)
        }
    }
}

extension BoxMoviesCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoveisDetailCell.identifier, for: indexPath) as! MoveisDetailCell
        cell.configure(image: items[indexPath.row].image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 156, height: 230)
    }
    
}
