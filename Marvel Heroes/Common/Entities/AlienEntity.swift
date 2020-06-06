//
//  AlienEntity.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 06/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Foundation

class AlienEntity {
    var name: String = ""
    var alterEgo: String = ""
    var imagePath: String = ""
    var biography: String = ""
    var abilities: AbilitiesEntity = AbilitiesEntity()
    var movies: [String] = []
    var caracteristics: CaracteristicsEntity = CaracteristicsEntity()
}
