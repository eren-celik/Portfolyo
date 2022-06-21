//
//  TransactionsView.swift
//  portfolyo
//
//  Created Eren  Çelik on 20.06.2022.
//  Copyright © 2022. All rights reserved.
//

import UIKit

final class TransactionsViewController: UIViewController {
    
    var viperBuilder: VIPERBuilder<TransactionsInteractor, TransactionsPresenter, TransactionsRouter>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

extension TransactionsViewController: TransactionsViewProtocol {
    
}
