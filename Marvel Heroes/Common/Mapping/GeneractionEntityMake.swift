//
//  GeneractionEntityMake.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 06/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Foundation

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
        caracteristics.universe = model.universe.rawValue
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
