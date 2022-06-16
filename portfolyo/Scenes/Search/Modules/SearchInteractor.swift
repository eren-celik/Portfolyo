//
//  SearchInteractor.swift
//  portfolyo
//
//  Created Eren  Çelik on 16.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class SearchInteractor: SearchInteractorProtocol {
    
    weak var delegate: SearchViewInteractorDelegate?
    private var manager: NetworkManager<MarketAPI>?
    
    init(manager: NetworkManager<MarketAPI>) {
        self.manager = manager
    }
    
    func searchCoins(_ keyword: String) {
        
    }
}
