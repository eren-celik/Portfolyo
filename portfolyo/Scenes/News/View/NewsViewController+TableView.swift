//
//  NewsViewController+TableView.swift
//  portfolyo
//
//  Created by Eren  Çelik on 8.06.2022.
//

import UIKit

extension NewsViewController {
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nibName = UINib(nibName: "NewsTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "NewsTableViewCell")
    }
}

extension NewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NewsTableViewCell = tableView.reusableCell()
        cell.newsData = news[indexPath.row]
        return cell
    }
}

extension NewsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = news[indexPath.row]
        presenter.showDetail(news)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
}

extension NewsViewController: NewsViewProtocol {
    
    func showNews(_ news: [Article]) {
        self.news = news
    }
    
    func showErrorMessage(_ message: String) {
        self.showAlert(title: "Error", message)
    }
}
