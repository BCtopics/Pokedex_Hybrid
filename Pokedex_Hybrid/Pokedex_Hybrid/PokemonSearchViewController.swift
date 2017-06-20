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
        // Will come back when we create PokemonController
    }
    
}
