//
//  Market+Interactor.swift
//  portfolyo
//
//  Created by Eren  Çelik on 16.06.2022.
//

import Foundation

final class MarketInteractor: MarketInteractorProtocol {
    
    weak var delegate: MarketViewInteractorDelegate?
    private var manager: NetworkManager<AppAPI>?
    
    init(manager: NetworkManager<AppAPI>) {
        self.manager = manager
    }
    
    func getCoinList() {
       print("DEBUG: inter")
    }
}
