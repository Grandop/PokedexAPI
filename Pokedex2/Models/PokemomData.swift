//
//  PokemomData.swift
//  Pokedex2
//
//  Created by Pedro Grando on 25/11/22.
//

import Foundation

struct PokemonData: Codable {
    var name: String
    var url: String
    var imageURL: String {
        var imgURL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
        var id: String = ""
        var barNumber: Int = 0
        
        for letter in url.reversed() {
            
            if letter == "/" {
                barNumber += 1
            }
            if barNumber == 1 && letter != "/" {
                id += String(letter)
            }
            if barNumber == 2 {
                break
            }
        }
        return imgURL + id.reversed() + ".png"
    }
    
    enum CodingKeys: CodingKey {
        case name
        case url
    }
}

