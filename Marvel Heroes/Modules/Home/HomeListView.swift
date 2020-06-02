//
//  ViewController.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 01/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit


struct ItemDefault {
    
}
class HomeListView: CollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .white
        let image = UIImage(named: "logo")
        navigationItem.titleView = UIImageView(image: image)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: nil, action: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sections = [
            SectionsHead(items: [ItemDefault()], name: "")
        ]
    }

}

