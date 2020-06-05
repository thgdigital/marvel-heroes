//
//  HomePresenter.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 04/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class HomePresenter: HomePresenterInput {
    
    weak var output: HomePresenterOutput?
    
    var interactor: HomeInteractorInput
    
    var wireframe: HomeWireframe
    
    init(wireframe: HomeWireframe, interactor: HomeInteractor) {
        self.wireframe = wireframe
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        interactor.loadData()
    }
}

extension HomePresenter: HomeInteractorOutput {
    
    func loadData(entity: GeneractionEntity) {
        
        let sections = [
            SectionsHead(items: [ItemDefault()]),
            SectionsHeros(items: entity.heroes, name: "Heróis"),
            SectionsHeros(items: entity.villains, name: "Vilões"),
            SectionsHeros(items: entity.antiHeroes, name: "Anti-heróis"),
            SectionsHeros(items: entity.aliens, name: "Alienígenas"),
            SectionsHeros(items: entity.humans, name: "Humanos")
        ]
        output?.load(sections: sections)
    }
    
    func didSelected(alien: AlienEntity, idHero: String) {
        wireframe.showDetail(idHero: idHero, alien: alien)
    }
}

class ItemMake {
    
    static func mapping(alien: AlienEntity) -> ItemHeroes {
        return ItemHeroes(protagonist: alien.alterEgo, nameMovies: alien.name, image: UIImageView(image: UIImage(named: alien.imagePath)))
    }
}
