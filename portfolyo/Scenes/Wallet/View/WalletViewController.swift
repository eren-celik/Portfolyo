//
//  WalletViewController.swift
//  portfolyo
//
//  Created by Eren  Çelik on 14.06.2022.
//

import UIKit

class WalletViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.visibleViewController?.title = "Wallet"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}
