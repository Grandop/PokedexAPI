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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pokedex"
        self.navigationController?.navigationBar.tintColor = .black
        getApi()
        pokedexTableView.dataSource = self
    }
}




