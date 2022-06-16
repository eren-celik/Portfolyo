//
//  SearchView.swift
//  portfolyo
//
//  Created Eren  Çelik on 16.06.2022.
//  Copyright © 2022. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    var presenter: SearchPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Search"
    }
    
}

extension SearchViewController: SearchViewProtocol {
    
    func showCoinList(coins: CoinListModel) {
        
    }
    
    func showErrorMessage(_ message: String) {
        
    }
}
