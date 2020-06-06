//
//  Abilities.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 06/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Foundation

// MARK: - Abilities
struct Abilities: Codable {
    let force, intelligence, agility, endurance: Int
    let velocity: Int
}
