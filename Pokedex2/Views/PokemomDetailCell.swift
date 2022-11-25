//
//  pokemomDetailCell.swift
//  Pokedex2
//
//  Created by Pedro Grando on 25/11/22.
//

import UIKit

class PokemomDetailCell: UITableViewCell {

    @IBOutlet weak var leftPokemom: UIImageView!
    @IBOutlet weak var leftNamePokemom: UILabel!
    
    @IBOutlet weak var rightPokemom: UIImageView!
    @IBOutlet weak var rightNamePokemom: UILabel!
    
    
    
    func configCell(leftPokemom: PokemonData, rightPokemom: PokemonData)  {
        leftNamePokemom.text = leftPokemom.name
        rightNamePokemom.text = rightPokemom.name
    }
}
