//
//  Stats.swift
//  Pokedex2
//
//  Created by Pedro Grando on 27/11/22.
//

import Foundation

struct Stat: Codable {
    var baseStat: Int
    var stat: StatData
}

enum CodingKeys: String, CodingKey {
    case baseStat = "base_stat"
    
}
