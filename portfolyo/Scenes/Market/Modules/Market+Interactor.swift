//
//  Market+Interactor.swift
//  portfolyo
//
//  Created by Eren  Çelik on 16.06.2022.
//

import Foundation

final class MarketInteractor: MarketInteractorProtocol {
    
    weak var delegate: MarketViewInteractorDelegate?
    private var manager: NetworkManager<MarketAPI>?
    
    init(manager: NetworkManager<MarketAPI>) {
        self.manager = manager
    }
    
    func getCoinList() {
        typealias CoinModel = Result<CoinListModel, GUNetworkErrors>
        manager?.request(target: .coins(perPage: 10), completion: { [weak self] (result: CoinModel) in
            switch result {
            case .success(let data):
                self?.delegate?.handleOutput(.showCoins(coins: data))
            case .failure(_):
                self?.delegate?.handleOutput(.showError)
            }
        })
    }
}
