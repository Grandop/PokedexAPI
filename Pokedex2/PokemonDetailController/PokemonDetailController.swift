//
//  PokemomDetailController.swift
//  Pokedex2
//
//  Created by Pedro Grando on 27/11/22.
//

import UIKit

class PokemonDetailController: UIViewController {
    
    @IBOutlet weak var baseStatsView: UIView!
    @IBOutlet weak var NamePokemom: UILabel!
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var imagePokemom: UIImageView!
    
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var pokemom: PokemonStats?
    static var pokemonId: String!
    var pokemonImage: String?
    var pokemonInteractor = PokemonDetailInteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    func setupLayout() {
        backgroundView.layer.cornerRadius = 15
        backgroundView.layer.borderWidth = 2
        baseStatsView.layer.cornerRadius = 30
        pokemonInteractor.detailDelegate = self
        pokemonInteractor.getApi()
    }
    
    static func formatURL() -> String {
        let url = "https://pokeapi.co/api/v2/pokemon/\(PokemonDetailController.pokemonId ?? "")"
        return url
    }
}

extension PokemonDetailController: PokemonDetailDelegate {
    func successAPI(pokemonStats: PokemonStats) {
        DispatchQueue.main.async {
            self.NamePokemom.text = self.pokemom?.name.capitalized
            self.imagePokemom.loadFrom(UrlAddress: self.pokemonImage ?? "")
            self.healthLabel.text = "Health: \(pokemonStats.stats![0].baseStat)"
            self.attackLabel.text = "Attack: \(pokemonStats.stats![1].baseStat)"
            self.defenseLabel.text = "Defense: \(pokemonStats.stats![2].baseStat)"
            self.speedLabel.text = "Speed: \(pokemonStats.stats![5].baseStat)"
        }
    }
}
