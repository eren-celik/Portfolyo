//
//  Market+Contracts.swift
//  portfolyo
//
//  Created by Eren  Çelik on 14.06.2022.
//

import UIKit

//MARK: - VIEW

protocol MarketViewProtocol: AnyObject {
    func showCoinList(coins: CoinListModel)
}

//MARK: - PRESENTER

protocol MarketPresenterProtocol: AnyObject {
    func getBaseData()
    func showSearch()
}

//MARK: - INTERACTOR

protocol MarketInteractorProtocol: AnyObject {
    var delegate: MarketViewInteractorDelegate? { get set }
    func getCoinList()
    func getExchageList()
}

protocol MarketViewInteractorDelegate: AnyObject {
    func handleOutput(_ output: MarketViewInteractorOutput)
}

enum MarketViewInteractorOutput {
    case showCoins(coins: CoinListModel)
    case showError
}

//MARK: - Router

protocol MarketRouterProtocol: AnyObject {
    func navigate(to route: MarketViewRoute)
}

enum MarketViewRoute {
    case search
}
