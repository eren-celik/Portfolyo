//
//  TransactionsPresenter.swift
//  portfolyo
//
//  Created Eren  Çelik on 20.06.2022.
//  Copyright © 2022. All rights reserved.
//

import UIKit

class TransactionsPresenter: TransactionsPresenterProtocol {
    
    private unowned var view: TransactionsViewProtocol
    private var interactor: TransactionsInteractorProtocol
    private var router: TransactionsRouterProtocol
    
    init(view: TransactionsViewProtocol,
         interactor: TransactionsInteractorProtocol,
         router: TransactionsRouterProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.interactor.delegate = self
    }
}

extension TransactionsPresenter: TransactionsInteractorDelegate {
    func handleOutput(_ output: [String : Any]) {
        
    }
}
