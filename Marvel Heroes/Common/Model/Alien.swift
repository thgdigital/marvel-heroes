//
//  Alien.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 06/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Foundation

// MARK: - Alien
struct Alien: Codable {
    let name, alterEgo, imagePath, biography: String
    let caracteristics: Caracteristics
    let abilities: Abilities
    let movies: [String]
}
