//
//  WalletViewController.swift
//  portfolyo
//
//  Created by Eren  Çelik on 14.06.2022.
//

import UIKit

final class MarketViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viperBuilder: VIPERBuilder<MarketInteractor, MarketPresenter, MarketRouter>!
    
    var coinList: [MarketPresenter.Sections] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viperBuilder.presenter.getBaseData()
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
