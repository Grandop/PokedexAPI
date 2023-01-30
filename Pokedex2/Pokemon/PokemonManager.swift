//
//  PokemonManager.swift
//  Pokedex2
//
//  Created by Vinicius da Luz on 30/01/23.
//

import Foundation

protocol PokemonDataDelegate {
    func passPokemonData()
}

struct PokemonManager {
    
    let pokemonDelegate: PokemonDataDelegate
    
    func getApiHome() {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=100")
        
        if let url = url {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: request) { data, response, error in
                
                if let data = data, error == nil {
                    do {
                        let decoder = JSONDecoder()
                        
                        let pokemon = try decoder.decode(Pokemons.self, from: data)
                        
                        self.pokemon = pokemon

                        DispatchQueue.main.async {
                            self.pokedexTableView.reloadData()
                        }
                        
                    } catch let error {
                        print(error.localizedDescription)
                    }
                }
            }
            task.resume()
        }
    }
    
}
