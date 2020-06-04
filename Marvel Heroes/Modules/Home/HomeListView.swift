//
//  ViewController.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 01/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit
import Hero

struct ItemDefault {}

class HomeListView: CollectionViewController {
    
    var presenter: HomePresenterInput!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.viewDidLoad()
    }
    
    func setupView() {
        view.backgroundColor = .white
        let image = UIImage(named: "logo")
        navigationItem.titleView = UIImageView(image: image)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: nil, action: nil)
    }

}

extension HomeListView: HomePresenterOutput, SectionsHerosDelegate {
    
    func didSelected(alien: AlienEntity, idHero: String) {
        presenter.didSelected(alien: alien, idHero: idHero)
    }

    func load(sections: [Sections]) {
        self.sections = sections
        collectionView.reloadData()
    }
}

