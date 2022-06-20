//
//  TransactionsContracts.swift
//  portfolyo
//
//  Created Eren  Çelik on 20.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: View -
protocol TransactionsViewProtocol: AnyObject {
}

//MARK: Interactor -
protocol TransactionsInteractorProtocol: AnyObject {
    var delegate: TransactionsInteractorDelegate? { get set }
}

protocol TransactionsInteractorDelegate: AnyObject {
    func handleOutput(_ output: [String: Any])
}

//MARK: Presenter -
protocol TransactionsPresenterProtocol: AnyObject {
    
}
//MARK: - Router

protocol TransactionsRouterProtocol {
    func navigate(to route: TransactionsRoute)
}

enum TransactionsRoute {
}
