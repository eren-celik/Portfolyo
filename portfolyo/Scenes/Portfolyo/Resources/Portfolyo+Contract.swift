//
//  Portfolyo+Contract.swift
//  portfolyo
//
//  Created by Eren  Çelik on 18.06.2022.
//

import Foundation

protocol PortfolyoViewProtocol: AnyObject {
    func showList(section: Array<PortfolyoPresenter.Sections>)
}

//MARK: - PRESENTER

protocol PortfolyoPresenterProtocol: AnyObject {
    func preparePortfolyoData()
}

//MARK: - INTERACTOR

protocol PortfolyoInteractorProtocol: AnyObject {
    var delegate: PortfolyoViewInteractorDelegate? { get set }
    func getPorfolyoData()    
}

protocol PortfolyoViewInteractorDelegate: AnyObject {
    func handleOutput(_ output: [String: Any])
}

//MARK: - Router

protocol PortfolyoRouterProtocol: AnyObject {
    func navigate(to route: PortfolyoViewRoute)
}

enum PortfolyoViewRoute {
    case coinDetail
}
