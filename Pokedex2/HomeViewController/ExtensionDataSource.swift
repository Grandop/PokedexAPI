//
//  ExtensionDataSource.swift
//  Pokedex2
//
//  Created by Pedro Grando on 25/11/22.
//

import Foundation
import UIKit


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (pokemon?.results.count ?? 0) / 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PokemonDetailCell
        
        var pokemon: [PokemonData] = []

        let leftPokemon = self.pokemon!.results[indexPath.row * 2]
        let rightPokemon = self.pokemon!.results[(indexPath.row * 2) + 1]
        
        pokemon.append(leftPokemon)
        pokemon.append(rightPokemon)
        
        let tapGestureLeft = PokemonTapGesture.init(target: self, action: #selector(self.userTap))
        let tapGestureRight = PokemonTapGesture.init(target: self, action: #selector(self.userTap))
        
        cell.backgroundLeft.addGestureRecognizer(tapGestureLeft)
        cell.backgroundRight.addGestureRecognizer(tapGestureRight)
        
        tapGestureLeft.addTarget(self, action: #selector(userTap))
        tapGestureLeft.namePokemon = leftPokemon.name
        tapGestureLeft.idPokemon = leftPokemon.getId()
        tapGestureLeft.pokemonImage = pokemon[0].imageURL
        
        tapGestureRight.addTarget(self, action: #selector(userTap))
        tapGestureRight.namePokemon = rightPokemon.name
        tapGestureRight.idPokemon = rightPokemon.getId()
        tapGestureRight.pokemonImage = pokemon[1].imageURL
        
        cell.configCell(pokemon: pokemon)
        
        return cell
    }
    
    @objc func userTap(_ sender: PokemonTapGesture) {
        
        let pokemonDetailStoryboard: UIStoryboard = UIStoryboard(name: "PokemomDetail", bundle: nil)

        let pokemonDetailVC = pokemonDetailStoryboard.instantiateViewController(withIdentifier: "pokemomDetail") as! PokemonDetailController

        pokemonDetailVC.pokemonId = sender.idPokemon
        pokemonDetailVC.pokemonImage = sender.pokemonImage

        self.navigationController?.pushViewController(pokemonDetailVC, animated: true)
    }
    
}

class PokemonTapGesture: UITapGestureRecognizer {
    var namePokemon: String?
    var idPokemon: String?
    var pokemonImage: String?
}
