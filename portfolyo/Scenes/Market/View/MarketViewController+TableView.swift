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
    
    func showCoinList(coins: CoinListModel) {
        coinList.append(contentsOf: coins)
    }
}

extension MarketViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinList.count
    }
}

extension MarketViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
            return cell
        }()
        
        cell.textLabel?.text = coinList[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
