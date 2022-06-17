//
//  MarketViewController+TableView.swift
//  portfolyo
//
//  Created by Eren  Çelik on 16.06.2022.
//

import UIKit

extension MarketViewController {
    
    func setTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension MarketViewController: MarketViewProtocol {
    
    func showList(section: Array<MarketPresenter.Sections>) {
        coinList.append(contentsOf: section)
    }
}

extension MarketViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinList.count
    }
}

extension MarketViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sec = coinList[indexPath.row]
        return setTableViewRow(sec)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    private func setTableViewRow(_ sections: MarketPresenter.Sections) -> UITableViewCell {
        let cell: UITableViewCell = {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
            return cell
        }()
        
        switch sections {
        case .coinCell(let title, _):
            cell.textLabel?.text = title
        case .exchangeCelll(let title, _):
            cell.textLabel?.text = title
        case .textCell(let text):
            cell.textLabel?.text = text
        }
        return cell
    }
}
