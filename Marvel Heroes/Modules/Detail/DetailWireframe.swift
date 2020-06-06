//
//  DetailWireframe.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 04/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class DetailWireframe {
    weak var viewController: UIViewController?
    
    func showView(idHero: String, alien: AlienEntity) -> UIViewController {
        let presenter = DetailPresenter(alien: alien, idHero: idHero, wireframe: self)
        
        let detailViewController = DetailController(collectionViewLayout: UICollectionViewFlowLayout())
        detailViewController.idHero = idHero
        detailViewController.presenter = presenter
        presenter.output = detailViewController
        viewController = detailViewController
        detailViewController.modalPresentationStyle = .fullScreen
        return detailViewController
    }
    func closeView() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
