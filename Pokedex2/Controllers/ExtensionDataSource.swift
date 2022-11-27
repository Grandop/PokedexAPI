//
//  ExtensionDataSource.swift
//  Pokedex2
//
//  Created by Pedro Grando on 25/11/22.
//

import Foundation
import UIKit


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (pokemom?.results.count ?? 0) / 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PokemomDetailCell
        
        var pokemom: [PokemonData] = []
        
        pokemom.append(self.pokemom!.results[indexPath.row * 2])
        pokemom.append(self.pokemom!.results[(indexPath.row * 2) + 1])
    
        let tapGestureLeft = UITapGestureRecognizer()
        let tapGestureRight = UITapGestureRecognizer()
        
        cell.backgroundLeft.addGestureRecognizer(tapGestureLeft)
        cell.backgroundRight.addGestureRecognizer(tapGestureRight)
        
        tapGestureLeft.addTarget(self, action: #selector(userTap))
        tapGestureRight.addTarget(self, action: #selector(userTap))
        
        cell.configCell(pokemom: pokemom)
        
        return cell
    }
    
    @objc func userTap() {
        let pokemomDetailStoryboard: UIStoryboard = UIStoryboard(name: "PokemomDetail", bundle: nil)
        
        let pokemomDetailVC = pokemomDetailStoryboard.instantiateViewController(withIdentifier: "pokemomDetail") as! PokemomDetailController
        
//        pokemomDetailVC.
        
        self.navigationController?.pushViewController(pokemomDetailVC, animated: true)
        
    }
    
    
    
}
