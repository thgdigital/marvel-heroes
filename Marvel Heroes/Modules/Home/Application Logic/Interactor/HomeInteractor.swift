//
//  HomeInteractor.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 04/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Foundation


class HomeInteractor: HomeInteractorInput {
    
    weak var ouput:HomeInteractorOutput?
    
    var manager: MarvelManager
    
    init(manager: MarvelManager) {
        self.manager = manager
    }
    
    func loadData() {
        
        manager.getHeroes{ [weak self] result in
            guard let strongSelf = self else {
                return
            }
            
            switch result {
                
            case .success(let result):
                strongSelf.ouput?.loadData(entity: GeneractionEntityMake.makeEntity(model: result))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
