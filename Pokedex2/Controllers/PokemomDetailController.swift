//
//  PokemomDetailController.swift
//  Pokedex2
//
//  Created by Pedro Grando on 27/11/22.
//

import UIKit

class PokemomDetailController: UIViewController {
    
    @IBOutlet weak var NamePokemom: UILabel!
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var imagePokemom: UIImageView!
    
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    //var pokemom:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getApi(id: "1")
        setupLayout()
    }
    
    func setupLayout() {
        //NamePokemom.text = pokemom?.
        backgroundView.layer.cornerRadius = 15
        backgroundView.layer.borderWidth = 2
    }
    
    func getApi(id: String) {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)")
        
        if let url = url {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("aplication/json", forHTTPHeaderField: "Content-Type")
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: request) { data, response, error in
                
                if let data = data, error == nil {
                    do {
                        let decoder = JSONDecoder()
                        let pokemom = try decoder.decode(PokemonData.self, from: data)
                        //self.pokemom = pokemom
                        
                        DispatchQueue.main.async {
                            
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

