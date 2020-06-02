//
//  ViewController.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 01/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit


struct ItemDefault {
    
}
class HomeListView: CollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .white
        let image = UIImage(named: "logo")
        navigationItem.titleView = UIImageView(image: image)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: nil, action: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let heroes = [
            ItemHeroes(protagonist: "Peter Parker", nameMovies: "Homem Aranha", image: UIImageView(image: UIImage(named: "spider-man"))),
            ItemHeroes(protagonist: "T'Challa", nameMovies: "Pantera Negra", image: UIImageView(image: UIImage(named: "black-panther.png"))),
            ItemHeroes(protagonist: "Tony Stark", nameMovies: "Homem de Ferro", image: UIImageView(image: UIImage(named: "iron-man")))
        ]
        let villains = [
            ItemHeroes(protagonist: "Jöhann Schmidt", nameMovies: "Caveira Vermelha", image: UIImageView(image: UIImage(named: "red-skull"))),
            ItemHeroes(protagonist: "Victor Von Doom", nameMovies: "Doutor Destino", image: UIImageView(image: UIImage(named: "dr-doom"))),
            ItemHeroes(protagonist: "Norman Osborn", nameMovies: "Duende Verde", image: UIImageView(image: UIImage(named: "green-goblit")))
        ]
        let aliens = [
            ItemHeroes(protagonist: "Deviant", nameMovies: "Thanos", image: UIImageView(image: UIImage(named: "thanos"))),
            ItemHeroes(protagonist: "Kree", nameMovies: "Ronan", image: UIImageView(image: UIImage(named: "ronan"))),
            ItemHeroes(protagonist: "Skrull", nameMovies: "Talos", image: UIImageView(image: UIImage(named: "talos")))
        ]
        
        
        let antiHeroes = [
            ItemHeroes(protagonist: "Wade Wilson", nameMovies: "Deadpool", image: UIImageView(image: UIImage(named: "deadpool"))),
            ItemHeroes(protagonist: "Eddie Brock", nameMovies: "Venom", image: UIImageView(image: UIImage(named: "venom"))),
            ItemHeroes(protagonist: "Francis Castle", nameMovies: "Justiceiro", image: UIImageView(image: UIImage(named: "punisher")))
        ]
        let humans = [
            ItemHeroes(protagonist: "Homem de Ferro", nameMovies: "Howard Stark", image: UIImageView(image: UIImage(named: "howard-stark"))),
            ItemHeroes(protagonist: "Homem Aranha", nameMovies: "Mary Jane", image: UIImageView(image: UIImage(named: "mary-jane"))),
            ItemHeroes(protagonist: "Homem de Ferro", nameMovies: "Happy Hogan", image: UIImageView(image: UIImage(named: "happy-hogan")))
        ]
        
//        let humans = [
//            ItemHeroes(protagonist: "Peter Parker", nameMovies: "Homem Aranha", image: UIImageView(image: UIImage(named: "spider-man.png"))),
//            ItemHeroes(protagonist: "T'Challa", nameMovies: "Pantera Negra", image: UIImageView(image: UIImage(named: "black-panther.png"))),
//            ItemHeroes(protagonist: "Tony Stark", nameMovies: "Homem de Ferro", image: UIImageView(image: UIImage(named: "iron-man.png")))
//        ]
//
        sections = [
            SectionsHead(items: [ItemDefault()], name: ""),
            SectionsHeros(items: heroes, name: "Heróis"),
            SectionsHeros(items: villains, name: "Vilões"),
            SectionsHeros(items: antiHeroes, name: "Anti-heróis"),
            SectionsHeros(items: aliens, name: "Alienígenas"),
            SectionsHeros(items: humans, name: "Humanos")
        ]
    }

}

