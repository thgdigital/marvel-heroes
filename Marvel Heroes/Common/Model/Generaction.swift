//
//  Generaction.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 06/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Foundation

// MARK: - Generaction
struct Generaction: Codable {
    let heroes, villains, antiHeroes, aliens: [Alien]
    let humans: [Alien]
}
