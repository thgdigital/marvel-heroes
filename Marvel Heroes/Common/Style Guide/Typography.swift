//
//  Typography.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 02/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

enum GilroyFontFamliy: String {
    case bold = "Gilroy-Bold"
    case heavy = "Gilroy-Heavy"
    case medium = "Gilroy-Medium"
    case regular = "Gilroy-Regular"
    case semibold = "Gilroy-SemiBold"
}

extension UIFont {
    
    static let profileTitle = UIFont(name: GilroyFontFamliy.heavy.rawValue, size: 40)
    static let homeTitle =  UIFont(name: GilroyFontFamliy.heavy.rawValue, size: 32)
    static let cardTitle =  UIFont(name: GilroyFontFamliy.heavy.rawValue, size: 20)
    static let sectionTitle = UIFont(name: GilroyFontFamliy.bold.rawValue, size: 18)
    static let profileSubTitle = UIFont(name: GilroyFontFamliy.medium.rawValue, size: 16)
    static let homeSubTitle = UIFont(name: GilroyFontFamliy.semibold.rawValue, size: 14)
    static let descriptionTitle = UIFont(name: GilroyFontFamliy.medium.rawValue, size: 14)
    static let abilityTitle = UIFont(name: GilroyFontFamliy.regular.rawValue, size: 12)
    static let caracteristicTitle = UIFont(name: GilroyFontFamliy.regular.rawValue, size: 12)
    static let cardSubTitle = UIFont(name: GilroyFontFamliy.medium.rawValue, size: 10)
}
