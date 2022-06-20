//
//  PortfolyoViewController+TableView.swift
//  portfolyo
//
//  Created by Eren  Çelik on 18.06.2022.
//

import UIKit

extension PortfolyoViewController {
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        registerCells()
    }
    
    private func registerCells() {
        let currencyNibName = UINib(nibName: "PortfolioCell", bundle: nil)
        let textNib = UINib(nibName: "TextCell", bundle: nil)
        let graphNib = UINib(nibName: "GraphCell", bundle: nil)
        let headerNib = UINib(nibName: "PortfolioInfoHeaderCell", bundle: nil)
        
        tableView.register(currencyNibName, forCellReuseIdentifier: "PortfolioCell")
        tableView.register(textNib, forCellReuseIdentifier: "TextCell")
        tableView.register(graphNib, forCellReuseIdentifier: "GraphCell")
        tableView.register(headerNib, forCellReuseIdentifier: "PortfolioInfoHeaderCell")
    }
    
    func setTableViewCell(section: PortfolyoPresenter.Sections) -> UITableViewCell {
        let currencyCell: PortfolioCell = tableView.reusableCell()
        let textCell: TextCell = tableView.reusableCell()
        let graphCell: GraphCell = tableView.reusableCell()
        let headerCell: PortfolioInfoHeaderCell = tableView.reusableCell()
        
        switch section {
        case .itemCell(let data):
            currencyCell.coinData = data
            return currencyCell
        case .titleCell(let title):
            textCell.configureLabel(text: title,
                                    size: 25,
                                    weight: .semibold)
            return textCell
        case .graphCell(let data):
            graphCell.configureChart(data)
            return UITableViewCell()
        case .headerCell(let balance):
            headerCell.setupCell(balance: balance)
            return headerCell
        }
    }
}

extension PortfolyoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sectionList[indexPath.row].cellHeigth
    }
}

extension PortfolyoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sectionList[indexPath.row]
        return setTableViewCell(section: section)
    }
}

extension PortfolyoViewController: PortfolyoViewProtocol {
    
    func showList(section: Array<PortfolyoPresenter.Sections>) {
        sectionList.append(contentsOf: section)
    }
}
