//
//  TransactionsPresenter.swift
//  portfolyo
//
//  Created Eren  Çelik on 20.06.2022.
//  Copyright © 2022. All rights reserved.
//

import UIKit

final class TransactionsPresenter: VIPERPresenter, TransactionsPresenterProtocol {
    
    private var view: TransactionsViewProtocol? {
        return controller as? TransactionsViewProtocol
    }
    
    private var transactionsInteractor: TransactionsInteractor? {
        let interactora = interactor as? TransactionsInteractor
        interactora?.delegate = self
        return interactora
    }
}

extension TransactionsPresenter: TransactionsInteractorDelegate {
    
    func handleOutput(_ output: [String : Any]) {
        
    }
}
