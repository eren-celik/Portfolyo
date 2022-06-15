//
//  Market+Presenter.swift
//  portfolyo
//
//  Created by Eren  Çelik on 16.06.2022.
//

import Foundation

final class MarketPresenter: MarketPresenterProtocol {

    private unowned var view: MarketViewProtocol
    private var interactor: MarketInteractorProtocol
    private var router: MarketRouterProtocol
    
    init(view: MarketViewProtocol,
         interactor: MarketInteractorProtocol,
         router: MarketRouterProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.interactor.delegate = self
    }
    
    func getCoinList() {
        print("DEBUG: prese")
    }
}

extension MarketPresenter: MarketViewInteractorDelegate {
    
    func handleOutput(_ output: MarketViewInteractorOutput) {
        switch output {
        case .showCoins:
            break
        case .showError:
            break
        }
    }
}
