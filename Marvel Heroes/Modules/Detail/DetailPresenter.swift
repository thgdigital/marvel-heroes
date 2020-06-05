//
//  DetailPresenter.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 04/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Foundation


class DetailPresenter: DetailPresenterInput {
    
    weak var output: DetailPresenterOuput?
    
    let alien: AlienEntity
    
    let idHero: String
    
    init(alien: AlienEntity, idHero: String ) {
        self.alien = alien
        self.idHero = idHero
    }
    
    func viewDidLoad() {
        var sections: [Sections] = [Sections]()
        
        sections = [
            SectionHeaderDetail(items: [ItemHederDetail(alien: alien)]),
            CaracteristicsDetailSection(items: [ItemDefault()]),
            SectionDetailBiography(items:  [BiographyItem(alien: alien)])
        ]
        
//        SectionHeaderDetail(items: [ItemDefault()]),
        //            CaracteristicsDetailSection(items: [ItemDefault()]),
        //            SectionDetailBiography(items:  [ItemDefault()])
        
        output?.showBackgroundView(idHero: self.idHero, image: alien.imagePath)
        output?.loadView(sections: sections)
    }
}
