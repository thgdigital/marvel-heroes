//
//  AbilitiesItem.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 06/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Foundation

struct AbilitiesItem {
    
    var name: String = ""
    var maximum: Int = 0
    
    init(name:String, abilitie: Int) {
        self.name = name
        self.maximum = (20 * abilitie) / 100
    }
    
}
