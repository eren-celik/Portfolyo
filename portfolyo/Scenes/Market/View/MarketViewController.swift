//
//  WalletViewController.swift
//  portfolyo
//
//  Created by Eren  Çelik on 14.06.2022.
//

import UIKit

final class MarketViewController: UIViewController {
    
    var presenter: MarketPresenterProtocol!
    @IBOutlet weak var tableView: UITableView!
    
    var coinList: CoinListModel = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        presenter.getCoinList()
        setTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setNavigationBar()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        resetNavigationBar()
    }
}
