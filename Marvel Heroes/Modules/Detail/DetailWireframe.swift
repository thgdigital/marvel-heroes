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
    
    func showView(idHero: String, alien: AlienEntity) -> UINavigationController {
        let presenter = DetailPresenter(alien: alien, idHero: idHero, wireframe: self)
        
        let detailViewController = DetailController(collectionViewLayout: UICollectionViewFlowLayout())
        detailViewController.idHero = idHero
        detailViewController.presenter = presenter
        presenter.output = detailViewController
        viewController = detailViewController
        
        let navigation = UINavigationController(rootViewController: detailViewController)
        navigation.modalPresentationStyle = .fullScreen
        let navigationBar  = navigation.navigationBar
        navigationBar.shadowImage = UIImage()
        navigationBar.tintColor = .white
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        return navigation
    }
    func closeView() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
