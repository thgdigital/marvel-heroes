//
//  CaracteristicsItem.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 06/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Foundation

struct CaracteristicsItem {
    var image: String = ""
    var text: String = ""
    
    init(image: String, text: String) {
        self.image = image
        self.text = text
    }
}
