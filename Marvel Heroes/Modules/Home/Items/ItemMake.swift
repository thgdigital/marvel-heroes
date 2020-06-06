//
//  ItemMake.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 06/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class ItemMake {
    
    static func mapping(alien: AlienEntity) -> ItemHeroes {
        return ItemHeroes(protagonist: alien.alterEgo, nameMovies: alien.name, image: UIImageView(image: UIImage(named: alien.imagePath)))
    }
}
