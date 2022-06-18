//
//  Portfolyo+Presenter.swift
//  portfolyo
//
//  Created by Eren  Çelik on 18.06.2022.
//

import UIKit

final class PortfolyoPresenter: PortfolyoPresenterProtocol {
    
    private unowned var view: PortfolyoViewProtocol?
    private var interactor: PortfolyoInteractorProtocol
    private var router: PortfolyoRouterProtocol
    
    init(view: PortfolyoViewProtocol,
         interactor: PortfolyoInteractorProtocol,
         router: PortfolyoRouterProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.interactor.delegate = self
    }
    
}

extension PortfolyoPresenter: PortfolyoViewInteractorDelegate {
    
    func handleOutput(_ output: [String : Any]) {
        
    }
}

