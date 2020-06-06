//
//  BiographyItem.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 06/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Foundation

struct BiographyItem {
    
    var text: String = ""
    
    init(alien: AlienEntity) {
        text = alien.biography
    }
}
