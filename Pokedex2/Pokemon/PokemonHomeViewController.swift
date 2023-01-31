//
//  ViewController.swift
//  Pokedex2
//
//  Created by Pedro Grando on 25/11/22.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var pokedexTableView: UITableView!
    var pokemon: Pokemons?
    var pokemonInteractor = PokemonInteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        self.title = "Pokedex"
        self.navigationController?.navigationBar.tintColor = .black
        pokedexTableView.dataSource = self
        pokemonInteractor.pokemonDelegate = self
        pokemonInteractor.getApiHome()
    }
}

extension HomeViewController: PokemonDataDelegate {
    func passPokemonData(pokemonData: Pokemons) {
        DispatchQueue.main.async {
            self.pokemon = pokemonData
            self.pokedexTableView.reloadData()
        }
    }
}



