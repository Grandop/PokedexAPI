//
//  PokemonDetailInteractor.swift
//  Pokedex2
//
//  Created by Pedro Grando on 31/01/23.
//

import Foundation

protocol PokemonDetailDelegate {
    func successAPI(pokemonStats: PokemonStats)
}

class PokemonDetailInteractor: DetailPresenterOutput {
    var detailDelegate: PokemonDetailDelegate?
    
    func interactor() {
        getApi()
    }
    
    func getApi() {
        let url = URL(string: PokemonDetailController.formatURL())
        
        if let url = url {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("aplication/json", forHTTPHeaderField: "Content-Type")
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: request) { data, response, error in
                
                if let data = data, error == nil {
                    do {
                        
                        let decoder = JSONDecoder()
                        let statsPokemom = try decoder.decode(PokemonStats.self, from: data)
                        self.detailDelegate?.successAPI(pokemonStats: statsPokemom)
        
                    } catch let error {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
}
