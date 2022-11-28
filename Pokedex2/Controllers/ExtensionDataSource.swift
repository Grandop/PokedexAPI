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
        return (pokemom?.results.count ?? 0) / 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PokemomDetailCell
        
        var pokemom: [PokemonData] = []

        var leftPokemon = self.pokemom!.results[indexPath.row * 2]
        var rightPokemon = self.pokemom!.results[(indexPath.row * 2) + 1]
        
        pokemom.append(leftPokemon)
        pokemom.append(rightPokemon)
        
        let tapGestureLeft = PokemonTapGesture.init(target: self, action: #selector(self.userTap))
        let tapGestureRight = PokemonTapGesture.init(target: self, action: #selector(self.userTap))
        
        cell.backgroundLeft.addGestureRecognizer(tapGestureLeft)
        cell.backgroundRight.addGestureRecognizer(tapGestureRight)
        
        tapGestureLeft.addTarget(self, action: #selector(userTap))
        tapGestureLeft.namePokemon = leftPokemon.name
        tapGestureLeft.idPokemon = leftPokemon.getId()
        
        tapGestureRight.addTarget(self, action: #selector(userTap))
        tapGestureRight.namePokemon = rightPokemon.name
        tapGestureRight.idPokemon = rightPokemon.getId()
        
        cell.configCell(pokemom: pokemom)
        
        return cell
    }
    
    @objc func userTap(_ sender: PokemonTapGesture) {
        
        let pokemomDetailStoryboard: UIStoryboard = UIStoryboard(name: "PokemomDetail", bundle: nil)

        let pokemomDetailVC = pokemomDetailStoryboard.instantiateViewController(withIdentifier: "pokemomDetail") as! PokemomDetailController

        pokemomDetailVC.pokemonId = sender.idPokemon


        self.navigationController?.pushViewController(pokemomDetailVC, animated: true)
    }
    
}


class PokemonTapGesture: UITapGestureRecognizer {
    var namePokemon: String?
    var idPokemon: String?
    
}
