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
        typealias Model = Result<SearchModel, GUNetworkErrors>
        manager?.request(target: .search(keyword: keyword), completion: { [weak self] (result: Model) in
            switch result {
            case .success(let data):
                self?.delegate?.handleOutput(.showCoins(coins: data))
            case .failure(let error):
                self?.delegate?.handleOutput(.showError(error.localizedDescription))
            }
        })
    }
}
