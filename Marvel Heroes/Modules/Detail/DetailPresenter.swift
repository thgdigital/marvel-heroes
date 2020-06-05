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
        let caracteristcs = [
            CaracteristicsItem(image: "Age", text: alien.caracteristics.birth),
            CaracteristicsItem(image: "Weight", text: "\(alien.caracteristics.height.value) kg"),
            CaracteristicsItem(image: "Height", text: "\(alien.caracteristics.height.value) m"),
            CaracteristicsItem(image: "Universe", text: "\(alien.caracteristics.universe)")]
        
        let sections = [
            SectionHeaderDetail(items: [ItemHederDetail(alien: alien)]),
            CaracteristicsDetailSection(items: caracteristcs),
            SectionDetailBiography(items:  [BiographyItem(alien: alien)]),
            SectionsDetailMoveis(items: alien.movies.map({MoviesItem(image: $0)}))
        ]
        output?.showBackgroundView(idHero: self.idHero, image: alien.imagePath)
        output?.loadView(sections: sections)
    }
}
