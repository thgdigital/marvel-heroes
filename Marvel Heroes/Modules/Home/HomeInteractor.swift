//
//  HomeInteractor.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 04/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Foundation


class HomeInteractor: HomeInteractorInput {
    
    weak var ouput:HomeInteractorOutput?
    
    var manager: MarvelManager
    
    init(manager: MarvelManager) {
        self.manager = manager
    }
    
    func loadData() {
        
        manager.getHeroes{ [weak self] result in
            guard let strongSelf = self else {
                return
            }
            
            switch result {
                
            case .success(let result):
                strongSelf.ouput?.loadData(entity: GeneractionEntityMake.makeEntity(model: result))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

class GeneractionEntityMake {
    
    static func makeEntity(model: Generaction) -> GeneractionEntity {
        let generaction = GeneractionEntity()
        generaction.aliens = model.aliens.map({ makeEntityAlien(model: $0 )})
        generaction.antiHeroes = model.antiHeroes.map({ makeEntityAlien(model: $0 )})
        generaction.heroes = model.heroes.map({ makeEntityAlien(model: $0 )})
        generaction.humans = model.humans.map({ makeEntityAlien(model: $0 )})
        generaction.villains = model.villains.map({ makeEntityAlien(model: $0 )})
        
        return generaction
    }
    
    static func makeEntityAlien(model: Alien) -> AlienEntity {
        let alien = AlienEntity()
        alien.alterEgo = model.alterEgo
        alien.biography = model.biography
        alien.imagePath = model.imagePath
        alien.name = model.name
        alien.abilities = makeEntityAbilities(model: model.abilities)
        alien.caracteristics = makeEntityCaracteristics(model: model.caracteristics)
        alien.movies = model.movies
    
        return alien
    }
    
    static func makeEntityAbilities(model: Abilities) -> AbilitiesEntity {
        let abilities = AbilitiesEntity()
        abilities.agility = model.agility
        abilities.endurance = model.endurance
        abilities.force = model.force
        abilities.intelligence = model.intelligence
        abilities.velocity = model.velocity
        
        return abilities
    }
    
    static func makeEntityCaracteristics(model: Caracteristics) -> CaracteristicsEntity {
        let caracteristics = CaracteristicsEntity()
        caracteristics.birth = model.birth
        caracteristics.height = makeEntityEight(model: model.height)
        caracteristics.weight = makeEntityEight(model: model.weight)
        return caracteristics
    }
    
    static func makeEntityEight(model: Eight) -> EightEntity {
        let eightEntity =  EightEntity()
        eightEntity.value = model.value
        switch model.unity {
        case .kg:
          eightEntity.unity = .kg
        case .meters:
            eightEntity.unity = .meters
        }
        return eightEntity
    }
}

class GeneractionEntity {
    var heroes: [AlienEntity] = []
    var villains: [AlienEntity] = []
    var antiHeroes: [AlienEntity] = []
    var aliens: [AlienEntity] = []
    var humans: [AlienEntity] = []
}

class AbilitiesEntity {
    var force: Int = 0
    var intelligence: Int = 0
    var agility: Int = 0
    var endurance: Int = 0
    var velocity: Int = 0
}
class AlienEntity {
    var name: String = ""
    var alterEgo: String = ""
    var imagePath: String = ""
    var biography: String = ""
    var abilities: AbilitiesEntity = AbilitiesEntity()
    var movies: [String] = []
    var caracteristics: CaracteristicsEntity = CaracteristicsEntity()
}
class CaracteristicsEntity {
    var birth: String = ""
    var weight: EightEntity = EightEntity()
    var height: EightEntity = EightEntity()
    
}
class EightEntity {
    var value: Double = 0.0
    var unity: UnityEntity = .kg
}

enum UnityEntity: String {
    case kg = "kg"
    case meters = "meters"
}
