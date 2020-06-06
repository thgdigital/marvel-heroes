//
//  MarvelManager.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 04/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Foundation

class MarvelManager {

    func getHeroes(completionHandler: @escaping  (Result<Generaction, Error>)-> Void ) {
        
        guard let generaction = loadJson(filename: "application") else {
            let errorTemp = ErrorCustom.custom(with: "Json não existe")

            completionHandler(.failure(errorTemp))
            return
        }
        completionHandler(.success(generaction))
    }

   fileprivate func loadJson(filename fileName: String) -> Generaction? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Generaction.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
                return nil
            }
        }
        return nil
    }
    
}

enum ErrorCustom: Error {
 
    case custom(with: String)
}
