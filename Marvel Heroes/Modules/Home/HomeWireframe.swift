//
//  HomeWireframe.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 04/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class HomeWireframe {
    
    weak var viewController: UIViewController?
    
    func loadView() -> UINavigationController {
        let interactor = HomeInteractor(manager: MarvelManager())
        let presenter = HomePresenter(wireframe: self, interactor: interactor)
        interactor.ouput = presenter
        let viewController = HomeListView(collectionViewLayout: UICollectionViewFlowLayout())
        viewController.presenter = presenter
        presenter.output = viewController
        self.viewController = viewController
        return makeNavigationController(viewController: viewController)
    }
    
    func makeNavigationController(viewController: UIViewController) -> UINavigationController {
        let navigation = UINavigationController(rootViewController: viewController)
            let navigationBar  = navigation.navigationBar
            navigationBar.shadowImage = UIImage()
            navigationBar.tintColor = .black
            navigationBar.isTranslucent = false
            navigationBar.backgroundColor = .white
        
        return navigation
    }
    
    func showDetail(idHero: String, alien: AlienEntity) {
        viewController?.present(DetailWireframe().showView(idHero: idHero, alien: alien), animated: true, completion: nil)
    }
}
