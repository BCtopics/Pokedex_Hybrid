//
//  PokemonSearchViewController.swift
//  Pokedex_Hybrid
//
//  Created by Bradley GIlmore on 6/20/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class PokemonSearchViewController: UIViewController, UISearchBarDelegate {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var abilitiesLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //MARK: - SearchBarDelegate Functions
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchTerm = searchBar.text else { return }
        
        BPGPokemonController.fetchPokemon(forSearchTerm: searchTerm) { (pokemon) in
            
            guard let pokemon = pokemon else { return }
            
            DispatchQueue.main.async {
                
                self.nameLabel.text = "Name: \(pokemon.name.capitalized)"
                self.idLabel.text = "ID: \(pokemon.identifier)"
                self.abilitiesLabel.text = "Abilities: \(pokemon.abilities.joined(separator: ", "))"
            }
        }
        
    }
    
}
