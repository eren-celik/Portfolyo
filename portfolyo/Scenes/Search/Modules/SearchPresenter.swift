//
//  SearchPresenter.swift
//  portfolyo
//
//  Created Eren  Çelik on 16.06.2022.
//  Copyright © 2022. All rights reserved.
//

import UIKit

final class SearchPresenter: SearchPresenterProtocol {
    
    private unowned var view: SearchViewProtocol?
    private var interactor: SearchInteractorProtocol
    private var router: SearchRouterProtocol
    
    init(view: SearchViewProtocol,
         interactor: SearchInteractorProtocol,
         router: SearchRouterProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.interactor.delegate = self
    }
    
    func searchItem(_ keyword: String) {
        interactor.searchCoins(keyword)
    }
}

extension SearchPresenter: SearchViewInteractorDelegate {
    
    func handleOutput(_ output: SearchViewInteractorOutput) {
        switch output {
        case .showCoins(let coins):
            view?.showCoinList(coins: coins)
        case .showError(let error):
            view?.showErrorMessage(error)
        }
    }
}
