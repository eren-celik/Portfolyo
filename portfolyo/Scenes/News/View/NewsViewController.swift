//
//  NewsView.swift
//  portfolyo
//
//  Created Eren  Çelik on 6.06.2022.
//  Copyright © 2022. All rights reserved.
//

import UIKit

final class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: NewsPresenterProtocol!
    
    var news: [Article] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    func setView() {
        presenter.loadNews()
        setTableView()
    }
}
