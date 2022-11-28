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
    
    var pokemom: PokemonStats?
    var pokemonId: String!
    var pokemonImage: [PokemonData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getApi()
        setupLayout()
    }
    
    func setupLayout() {
        backgroundView.layer.cornerRadius = 15
        backgroundView.layer.borderWidth = 2
    }
    
    func getApi() {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokemonId ?? "")")
        
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
                        self.pokemom = statsPokemom
                        
                        print(statsPokemom.stats![0].baseStat)
                        DispatchQueue.main.async {
                            self.NamePokemom.text = self.pokemom?.name.capitalized
                            self.imagePokemom.image = 
                            self.healthLabel.text = "Health: \(statsPokemom.stats![0].baseStat)"
                            self.attackLabel.text = "Attack: \(statsPokemom.stats![1].baseStat)"
                            self.defenseLabel.text = "Defense: \(statsPokemom.stats![2].baseStat)"
                            self.speedLabel.text = "Speed: \(statsPokemom.stats![5].baseStat)"
                        }
                        
                    } catch let error {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }

}

extension UIImageView {
    func loadFrom(UrlAddress: String) {
        guard let url = URL(string: UrlAddress) else {return}
        
        DispatchQueue.global().async {
            let imageData = try? Data(contentsOf: url)
            DispatchQueue.main.async { [weak self] in
                if let imageData = imageData {
                    if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                    }
                }
            }
        }
    }
}

