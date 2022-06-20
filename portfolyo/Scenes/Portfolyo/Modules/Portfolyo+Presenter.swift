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
    
    enum GoldTypes: CaseIterable {
        case gramGold
        case quarterGold
        case halfGold
        case cumhurGold
        case onsGold
        
        var name: String {
            switch self {
            case .gramGold:
                return "Gram Altın"
            case .quarterGold:
                return "Çeyrek Altın"
            case .halfGold:
                return "Yarım Altın"
            case .cumhurGold:
                return "Cumhuriyet Altın"
            case .onsGold:
                return "Ons Altın"
            }
        }
    }
    
    func defineDataSource(_ data: [String: Any]) -> [Sections] {
        var section = [Sections]()
        
        guard let userItems = data["userItems"] as? Results<PortfolyoRealmModel> else {
            section.append(.titleCell("Data Bulunamadı"))
            return section
        }
        
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
        for userItem in userData {
            guard let currencys = data.response?.filter({ $0.id == userItem.itemId && userItem.quantitiy > 0 }) else {
                return
            }
            
            for element in currencys {
                if element.id == "1983" {
                    let dto = PopularCurrencyData(id: element.id,
                                                  symbol: userItem.name,
                                                  currentPrice: element.currentPrice,
                                                  currentHoldings: Double(userItem.quantitiy))
                    goldSectionSetter(&section, element: dto)
                }else {
                    totalBalance.append(Double(userItem.quantitiy) * Double(element.currentPrice ?? "0.0")!)
                    let dto = CoinListElement(id: element.id,
                                              name: element.symbol,
                                              currentPrice: Double(element.currentPrice ?? "0.0")!,
                                              high24H: Double(element.high ?? "0.0")!,
                                              low24H: Double(element.low ?? "0.0")!,
                                              priceChangePercentage24H: Double(element.changePretenge ?? "0.0")!,
                                              currentHoldings: Double(userItem.quantitiy))
                    section.append(.itemCell(data: dto))
                }
            }
        }
    }
    
    func goldSectionSetter(_ section: inout Array<Sections>, element: PopularCurrencyData) {
        
        
        let price = Double(element.currentPrice ?? "0.0")!
        let gramPrice = price / 31.1034768
        var goldPrice = Double()
        var dto = CoinListElement()
        
        for goldType in GoldTypes.allCases where goldType.name == element.symbol {
            switch goldType {
            case .gramGold:
                goldPrice = gramPrice
                dto = CoinListElement(id: element.id,
                                      name: goldType.name,
                                      currentPrice: gramPrice,
                                      currentHoldings: element.currentHoldings)
                
            case .quarterGold:
                goldPrice = (gramPrice * 1.75)
                dto = CoinListElement(id: element.id,
                                      name: goldType.name,
                                      currentPrice: goldPrice,
                                      currentHoldings: element.currentHoldings)
            case .halfGold:
                goldPrice = (gramPrice * 3.6)
                dto = CoinListElement(id: element.id,
                                      name: goldType.name,
                                      currentPrice: (gramPrice * 3.6),
                                      currentHoldings: element.currentHoldings)
            case .cumhurGold:
                goldPrice = (gramPrice * 7)
                dto = CoinListElement(id: element.id,
                                      name: goldType.name,
                                      currentPrice: (gramPrice * 7),
                                      currentHoldings: element.currentHoldings)
            case .onsGold:
                goldPrice = price
                dto = CoinListElement(id: element.id,
                                      name: goldType.name,
                                      currentPrice: price,
                                      currentHoldings: element.currentHoldings)
            }
            totalBalance.append((element.currentHoldings ?? 0.0) * goldPrice)
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
