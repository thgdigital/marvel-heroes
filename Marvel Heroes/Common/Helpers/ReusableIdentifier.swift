//
//  ReusableIdentifier.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 04/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

protocol Identifier{}

extension Identifier where Self: NSObject{
    
    static var identifier: String { return String(describing: self) }
}

extension NSObject: Identifier {}
