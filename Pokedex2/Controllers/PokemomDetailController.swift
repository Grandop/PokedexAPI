//
//  PokemomDetailController.swift
//  Pokedex2
//
//  Created by Pedro Grando on 27/11/22.
//

import UIKit

class PokemomDetailController: UIViewController {

    @IBOutlet weak var NamePokemom: UILabel!
    @IBOutlet weak var imagePokemom: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    // var pokemom:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView.layer.cornerRadius = 15
        backgroundView.layer.borderWidth = 2
        
    }

}
