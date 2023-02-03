//
//  ViewController.swift
//  Pokedex2
//
//  Created by Pedro Grando on 25/11/22.
//

import UIKit

protocol PokemonPresenter: AnyObject {
    func interactor()
}

class HomeViewController: UIViewController {
    @IBOutlet weak var pokedexTableView: UITableView!
    var pokemonPresenterProtocol: PokemonPresenter?
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
        pokemonInteractor.interactor()
    }
    
    func setProtocols() {
        pokedexTableView.dataSource = self
        pokemonPresenter.pokemonPresenterOutPut = self
        pokemonPresenterProtocol = pokemonInteractor
        pokemonInteractor.pokemonDelegate = pokemonPresenter
    }
}

extension HomeViewController: PokemonPresenterOutPut {
    func presenter(pokemonsPresenter: Pokemons?) {
        DispatchQueue.main.async {
            self.pokemon = pokemonsPresenter
            self.pokedexTableView.reloadData()
        }
    }
}



