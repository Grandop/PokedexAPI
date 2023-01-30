//
//  PokemonStats.swift
//  Pokedex2
//
//  Created by Pedro Grando on 28/11/22.
//

import Foundation

struct PokemonStats: Codable {
    var id: Int?
    var name: String
    var stats: [Stat]?
}
