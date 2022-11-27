//
//  ViewController.swift
//  Pokedex2
//
//  Created by Pedro Grando on 25/11/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var pokedexTableView: UITableView!
    var pokemom: Pokemons?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pokedex"
        self.navigationController?.navigationBar.tintColor = .black
        getApi()
        pokedexTableView.dataSource = self
    }

    
    func getApi() {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=100")
        
        if let url = url {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("aplication/json", forHTTPHeaderField: "Content-Type")
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: request) { data, response, error in
                
                if let data = data, error == nil {
                    do {
                        let decoder = JSONDecoder()
                        
                        let pokemom = try decoder.decode(Pokemons.self, from: data)
                        
                        self.pokemom = pokemom
                        
                        
                        
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




