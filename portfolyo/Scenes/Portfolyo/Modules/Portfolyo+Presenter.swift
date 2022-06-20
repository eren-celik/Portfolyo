//
//  Portfolyo+Presenter.swift
//  portfolyo
//
//  Created by Eren  Çelik on 18.06.2022.
//

import UIKit
import RealmSwift

final class PortfolyoPresenter: PortfolyoPresenterProtocol {
    
    private unowned var view: PortfolyoViewProtocol?
    private var interactor: PortfolyoInteractorProtocol
    private var router: PortfolyoRouterProtocol
    
    private var totalBalance = [Double]()
    
    init(view: PortfolyoViewProtocol,
         interactor: PortfolyoInteractorProtocol,
         router: PortfolyoRouterProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.interactor.delegate = self
    }
    
    func preparePortfolyoData() {
        interactor.getPorfolyoData()
    }
}

extension PortfolyoPresenter: PortfolyoViewInteractorDelegate {
    
    func handleOutput(_ output: [String: Any]) {
        let sec = defineDataSource(output)
        view?.showList(section: sec)
    }
}

extension PortfolyoPresenter {
    
    enum Sections {
        case itemHeader
        case itemCell(data: CoinListElement)
        case titleCell(_ text: String)
        case graphCell(_ data: [Double])
        case headerCell(_ balance: String)
        
        var cellHeigth: CGFloat {
            switch self {
            case .itemHeader:
                return 40
            case .itemCell:
                return 90
            case .graphCell:
                return 300
            case .titleCell:
                return 50
            case .headerCell:
                return 70
            }
        }
    }
    
    func defineDataSource(_ data: [String: Any]) -> [Sections] {
        var section = [Sections]()
        
        guard let userItems = data["userItems"] as? Results<PortfolyoRealmModel> else {
            section.append(.titleCell("Data Bulunamadı"))
            return section
        }
        
        var arr = [Double]()
        userItems.forEach { model in
            arr.append(contentsOf: model.sparkline.toArray())
        }
        section.append(.graphCell(arr))
        
        section.append(.titleCell("Varlıklar"))
        section.append(.itemHeader)
        
        if let currency = data["popularCurrency"] as? PopularCurrencyModel {
            currencySection(&section, data: currency, userData: userItems)
        }
        
        if let coinItems = data["coinData"] as? CoinListModel {
            coinSection(&section, data: coinItems, userData: userItems)
        }
        
        if totalBalance.count > 0 {
            let sum = totalBalance.reduce(0, +)
            let price = sum.convertPrice()
            section.insert(.headerCell("\(price)"), at: 0)
        }
        
        return section
    }
    
    private func currencySection(_ section: inout Array<Sections>,
                                 data: PopularCurrencyModel,
                                 userData: Results<PortfolyoRealmModel>) {
        let arr = data.response?.compactMap({ element -> PopularCurrencyData in
            if let enitiy = userData.first(where: { $0.itemId == element.id }) {
                totalBalance.append(Double(enitiy.quantitiy) * Double(element.currentPrice ?? "0.0")!)
                return element.updateHoldings(amount: Double(enitiy.quantitiy))
            }
            return element
        })
        
        for element in (arr ?? []) {
            let dto = CoinListElement(id: element.id,
                                      name: element.symbol,
                                      currentPrice: Double(element.currentPrice ?? "0.0")!,
                                      high24H: Double(element.high ?? "0.0")!,
                                      low24H: Double(element.low ?? "0.0")!,
                                      priceChangePercentage24H: Double(element.changePretenge ?? "0.0")!,
                                      currentHoldings: element.currentHoldings)
            section.append(.itemCell(data: dto))
        }
    }
    
    private func coinSection(_ section: inout Array<Sections>,
                             data: CoinListModel,
                             userData: Results<PortfolyoRealmModel>) {
        let newCoinElements = data.compactMap { element -> CoinListElement in
            if let enitiy = userData.first(where: { $0.itemId == element.id }) {
                totalBalance.append(Double(enitiy.quantitiy) * (element.currentPrice ?? 0))
                return element.updateHoldings(amount: Double(enitiy.quantitiy))
            }
            return element
        }
        
        newCoinElements.forEach { element in
            section.append(.itemCell(data: element))
        }
    }
}
