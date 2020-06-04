//
//  HomeProtocol.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 04/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Foundation

protocol HomePresenterInput {
    func viewDidLoad()
    func didSelected(alien: AlienEntity, idHero: String)
}

protocol HomePresenterOutput: class {
    func load(sections: [Sections])
}

protocol HomeInteractorInput {
    func loadData()
}

protocol HomeInteractorOutput: class {
    func loadData(entity: GeneractionEntity)
}
