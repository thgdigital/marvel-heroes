//
//  DetailProtocol.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 04/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Foundation

protocol DetailPresenterInput {
    func viewDidLoad()
}

protocol DetailPresenterOuput: class {
    func loadView(sections: [Sections])
    func showBackgroundView(idHero: String, image: String)
}
