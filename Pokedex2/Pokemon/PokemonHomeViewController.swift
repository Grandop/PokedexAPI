//
//  ViewController.swift
//  Pokedex2
//
//  Created by Pedro Grando on 25/11/22.
//

import UIKit

protocol PokemonPresenterOutput: AnyObject {
    func presenter()
}

class HomeViewController: UIViewController {
    @IBOutlet weak var pokedexTableView: UITableView!
    var pokemonPresenterProtocol: PokemonPresenterOutput?
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
        setProtocols()
        pokemonPresenterProtocol?.presenter()
    }
    
    func setProtocols() {
        pokedexTableView.dataSource = self
        pokemonPresenter.pokemonPresenter = self
        pokemonPresenterProtocol = pokemonInteractor
        pokemonInteractor.pokemonDelegate = pokemonPresenter
    }
}

extension HomeViewController: PokemonPresenter {
    func interactor(pokemonsPresenter: Pokemons?) {
        DispatchQueue.main.async {
            self.pokemon = pokemonsPresenter
            self.pokedexTableView.reloadData()
        }
    }
}



