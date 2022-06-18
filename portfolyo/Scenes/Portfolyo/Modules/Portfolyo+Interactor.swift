//
//  Portfolyo+Interactor.swift
//  portfolyo
//
//  Created by Eren  Çelik on 18.06.2022.
//

import Foundation

final class PortfolyoInteractor: PortfolyoInteractorProtocol {
    
    weak var delegate: PortfolyoViewInteractorDelegate?
    private var manager: NetworkManager<MarketAPI>?
    
    init(manager: NetworkManager<MarketAPI>) {
        self.manager = manager
    }
    
}
