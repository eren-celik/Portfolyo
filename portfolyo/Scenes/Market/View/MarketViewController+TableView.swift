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
        tableView.separatorStyle = .none
        registerCells()
    }
    
    func registerCells() {
        let currencyNibName = UINib(nibName: "CurrencyCell", bundle: nil)
        let textNib = UINib(nibName: "TextCell", bundle: nil)
        
        tableView.register(currencyNibName, forCellReuseIdentifier: "CurrencyCell")
        tableView.register(textNib, forCellReuseIdentifier: "TextCell")
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
        let section = coinList[indexPath.row]
        return setTableViewRow(section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return coinList[indexPath.row].cellHeigth
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    private func setTableViewRow(_ sections: MarketPresenter.Sections) -> UITableViewCell {
        let currencyCell: CurrencyCell = tableView.reusableCell()
        let textCell: TextCell = tableView.reusableCell()
        
        switch sections {
        case .coinCell(let data):
            currencyCell.coinData = data
            return currencyCell
        case .currencyCell(let name, let value):
            currencyCell.setCurrencyData(name: name, value: value)
            return currencyCell
        case .textCell(let text):
            textCell.configureLabel(text: text, size: 25, weight: .bold)
            return textCell
        }
    }
}
