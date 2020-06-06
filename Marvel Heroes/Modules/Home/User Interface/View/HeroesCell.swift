//
//  HeroesCell.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 02/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit
import Hero

class HeroesCell: CollectionViewCell {
    @IBOutlet weak var heroesImageView: UIImageView!
    @IBOutlet weak var protagonistLabel: UILabel!
    @IBOutlet weak var moviesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        heroesImageView.layer.cornerRadius = 16
        moviesLabel.font = .cardTitle
        moviesLabel.textColor = .white
        protagonistLabel.font = .cardSubTitle
        protagonistLabel.textColor = .primaryGray
    }
    
    func configure(item: ItemHeroes, at indexPath: IndexPath) {
        moviesLabel.text = item.nameMovies
        protagonistLabel.text = item.protagonist
        heroesImageView.image = item.image.image
        heroesImageView.hero.id = "SectinId: \(indexPath.section) - row \(indexPath.row)"
    }
}
