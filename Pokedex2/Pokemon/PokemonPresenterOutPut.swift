//
//  PokemonPresenter.swift
//  Pokedex2
//
//  Created by Vinicius da Luz on 30/01/23.
//

import Foundation

protocol PokemonPresenterOutPut: AnyObject {
    func presenter(pokemonsPresenter: Pokemons?)
}

struct PokemonPresenterImplementation: PokemonDataDelegate {
    var pokemonPresenterOutPut: PokemonPresenterOutPut?
    
    func passPokemonData(pokemonData: Pokemons) {
        pokemonPresenterOutPut?.presenter(pokemonsPresenter: pokemonData)
    } 
}


