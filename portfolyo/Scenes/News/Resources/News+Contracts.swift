//
//  NewsContracts.swift
//  portfolyo
//
//  Created Eren  Çelik on 6.06.2022.
//  Copyright © 2022. All rights reserved.
//

import UIKit

//MARK: - VIEW
protocol NewsViewProtocol: AnyObject {
    func showNews(_ news: [Article])
    func showErrorMessage(_ message: String)
}

//MARK: - PRESENTER

protocol NewsPresenterProtocol: AnyObject {
    func loadNews()
    func showDetail(_ news: Article)
}

enum NewsViewPresenterOutput {
    case showNews([Article])
}

//MARK: - INTERACTOR

protocol NewsInteractorInputProtocol: AnyObject {
    var delegate: NewsViewInteractorDelegate? { get set }
    func getNews()
}

protocol NewsViewInteractorDelegate: AnyObject {
    func handleOutput(_ output: HomeViewInteractorOutput)
}

enum HomeViewInteractorOutput {
    case showNews([Article])
    case showError(String)
}

//MARK: - Router

protocol NewsRouterProtocol: AnyObject {
    func navigate(to route: NewsViewRoute)
}

enum NewsViewRoute {
    case detail(Article)
}
