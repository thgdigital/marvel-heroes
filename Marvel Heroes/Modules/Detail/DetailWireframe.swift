//
//  DetailWireframe.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 04/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class DetailWireframe {
    
    func showView(idHero: String, alien: AlienEntity) -> DetailController {
        let presenter = DetailPresenter(alien: alien, idHero: idHero)
   
        let detailViewController = DetailController(collectionViewLayout: UICollectionViewFlowLayout())
        detailViewController.idHero = idHero
        detailViewController.modalPresentationStyle = .fullScreen
        detailViewController.presenter = presenter
        presenter.output = detailViewController
        
        return detailViewController
    }
}
