//
//  PokemonDetailPresenter.swift
//  Pokedex2
//
//  Created by Pedro Grando on 01/02/23.
//

import Foundation

protocol DetailPresenter {
    func detailPresenter(pokemonsPresenter: PokemonStats?)
}

struct DetailPresenterImplementation: PokemonDetailDelegate {
    var detailPresenter: DetailPresenter?
    
    func successAPI(pokemonStats: PokemonStats) {
        detailPresenter?.detailPresenter(pokemonsPresenter: pokemonStats)
    }
    
    
    
}
