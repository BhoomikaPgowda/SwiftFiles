//
//  SearchViewController.swift
//  Wheather
//
//  Created by Bhoomika H P on 11/06/21.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        searchBar.searchTextField.backgroundColor = UIColor.white
        searchBar.layer.borderColor = UIColor.white.cgColor
        searchBar.setImage(UIImage(), for: .search, state: .normal)
        
        
    }
    
}



