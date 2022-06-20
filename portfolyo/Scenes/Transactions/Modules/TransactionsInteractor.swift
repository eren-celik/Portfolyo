//
//  TransactionsInteractor.swift
//  portfolyo
//
//  Created Eren  Çelik on 20.06.2022.
//  Copyright © 2022. All rights reserved.
//

import UIKit

final class TransactionsInteractor: TransactionsInteractorProtocol {
    
    weak var delegate: TransactionsInteractorDelegate?
    private var manager: NetworkManager<MarketAPI>?
    
    init(manager: NetworkManager<MarketAPI>) {
        self.manager = manager
    }
}
