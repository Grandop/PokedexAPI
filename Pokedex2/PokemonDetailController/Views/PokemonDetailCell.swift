//
//  pokemomDetailCell.swift
//  Pokedex2
//
//  Created by Pedro Grando on 25/11/22.
//

import UIKit

class PokemonDetailCell: UITableViewCell {

    @IBOutlet weak var leftPokemom: UIImageView!
    @IBOutlet weak var leftNamePokemom: UILabel!
    @IBOutlet weak var rightPokemom: UIImageView!
    @IBOutlet weak var rightNamePokemom: UILabel!
    
    @IBOutlet weak var backgroundCell: UIView!
    @IBOutlet weak var backgroundLeft: UIView!
    @IBOutlet weak var backgroundRight: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundLeft.layer.cornerRadius = 15
        backgroundRight.layer.cornerRadius = 15
        backgroundLeft.layer.borderWidth = 2
        backgroundRight.layer.borderWidth = 2
    }
    
    func configCell(pokemon: [PokemonData])  {
        leftNamePokemom.text = pokemon[0].name.capitalized
        leftPokemom.loadFrom(UrlAddress: pokemon[0].imageURL)
        
        rightNamePokemom.text = pokemon[1].name.capitalized
        rightPokemom.loadFrom(UrlAddress: pokemon[1].imageURL)
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
