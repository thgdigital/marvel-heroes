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

import Foundation

// MARK: - Generaction
struct Generaction: Codable {
    let heroes, villains, antiHeroes, aliens: [Alien]
    let humans: [Alien]
}

// MARK: - Alien
struct Alien: Codable {
    let name, alterEgo, imagePath, biography: String
    let caracteristics: Caracteristics
    let abilities: Abilities
    let movies: [String]
}

// MARK: - Abilities
struct Abilities: Codable {
    let force, intelligence, agility, endurance: Int
    let velocity: Int
}

// MARK: - Caracteristics
struct Caracteristics: Codable {
    let birth: String
    let weight, height: Eight
    let universe: Universe
}

// MARK: - Eight
struct Eight: Codable {
    let value: Double
    let unity: Unity
}

enum Unity: String, Codable {
    case kg = "kg"
    case meters = "meters"
}

enum Universe: String, Codable {
    case terra616 = "Terra 616"
}
