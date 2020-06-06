//
//  ItemHederDetail.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 06/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Foundation

struct ItemHederDetail {
    var name: String = ""
    var alterEgo: String = ""
    
    init(alien: AlienEntity) {
        name = alien.name
        alterEgo = alien.alterEgo
    }
}
