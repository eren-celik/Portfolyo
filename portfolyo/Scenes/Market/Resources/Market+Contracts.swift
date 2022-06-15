//
//  Market+Contracts.swift
//  portfolyo
//
//  Created by Eren  Çelik on 14.06.2022.
//

import UIKit

//MARK: - VIEW

protocol MarketViewProtocol: AnyObject {
    func showCoinList()
}

//MARK: - PRESENTER

protocol MarketPresenterProtocol: AnyObject {
    func getCoinList()
}

//MARK: - INTERACTOR

protocol MarketInteractorProtocol: AnyObject {
    var delegate: MarketViewInteractorDelegate? { get set }
    func getCoinList()
}

protocol MarketViewInteractorDelegate: AnyObject {
    func handleOutput(_ output: MarketViewInteractorOutput)
}

enum MarketViewInteractorOutput {
    case showCoins
    case showError
}

//MARK: - Router

protocol MarketRouterProtocol: AnyObject {
    func navigate(to route: NewsViewRoute)
}

enum MarketViewRoute {
    
}
