//
//  Search+Contracts.swift
//  portfolyo
//
//  Created by Eren  Çelik on 14.06.2022.
//

import UIKit

//MARK: - VIEW

protocol SearchViewProtocol: AnyObject {
    func showCoinList(coins: CoinListModel)
    func showErrorMessage(_ message: String)
}

//MARK: - PRESENTER

protocol SearchPresenterProtocol: AnyObject {
    func searchItem(_ keyword: String)
}

//MARK: - INTERACTOR

protocol SearchInteractorProtocol: AnyObject {
    var delegate: SearchViewInteractorDelegate? { get set }
    func searchCoins(_ keyword: String)
}

protocol SearchViewInteractorDelegate: AnyObject {
    func handleOutput(_ output: SearchViewInteractorOutput)
}

enum SearchViewInteractorOutput {
    case showCoins(coins: CoinListModel)
    case showError(_ message: String)
}

//MARK: - Router

protocol SearchRouterProtocol: AnyObject {
    func navigate(to route: SearchViewRoute)
}

enum SearchViewRoute {
    case coinDetail
}
