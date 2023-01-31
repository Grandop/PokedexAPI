//
//  PokemonPresenter.swift
//  Pokedex2
//
//  Created by Vinicius da Luz on 30/01/23.
//

import Foundation

protocol PokemonPresenter: AnyObject {
    func interactor(pokemonsPresenter: Pokemons?)
}

struct PokemonPresenterImplementation: PokemonDataDelegate {
    
    var pokemonPresenter: PokemonPresenter?
    
    func passPokemonData(pokemonData: Pokemons) {
        pokemonPresenter?.interactor(pokemonsPresenter: pokemonData)
    } 
    
}


