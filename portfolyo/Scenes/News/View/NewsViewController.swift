//
//  NewsView.swift
//  News
//
//  Created Eren  Çelik on 6.06.2022.
//  Copyright © 2022. All rights reserved.
//

import UIKit

final class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viperBuilder: VIPERBuilder<NewsInteractor, NewsPresenter, NewsRouter>!
    
    var news: [Article] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viperBuilder.presenter.loadNews()
        setView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setNavigationBar()
    }
    
    func setView() {
        setTableView()
    }
}
