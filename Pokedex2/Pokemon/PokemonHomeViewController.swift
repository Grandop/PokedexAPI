//
//  ViewController.swift
//  Pokedex2
//
//  Created by Pedro Grando on 25/11/22.
//

import UIKit

protocol PokemonPresenterOutput: AnyObject {
    func presenter(pokemonRequest: Pokemons?)
}


class HomeViewController: UIViewController {
    @IBOutlet weak var pokedexTableView: UITableView!
    var pokemon: Pokemons?
    var pokemonPresenter = PokemonPresenterImplementation()
    var pokemonInteractor = PokemonInteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        self.title = "Pokedex"
        self.navigationController?.navigationBar.tintColor = .black
        pokedexTableView.dataSource = self
        pokemonPresenter.pokemonPresenter = self
        
        pokemonInteractor.getApiHome()
    }
}

//extension HomeViewController: PokemonDataDelegate {
//    func passPokemonData(pokemonData: Pokemons) {
//        DispatchQueue.main.async {
//            self.pokemon = pokemonData
//            self.pokedexTableView.reloadData()
//        }
//    }
//}

extension HomeViewController: PokemonPresenter {
    func interactor(pokemonsPresenter: Pokemons?) {
        DispatchQueue.main.async {
            self.pokemon = pokemonsPresenter
            self.pokedexTableView.reloadData()
        }
    }
 
}



