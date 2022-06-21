//
//  Market+Presenter.swift
//  portfolyo
//
//  Created by Eren  Çelik on 16.06.2022.
//

import UIKit

final class MarketPresenter: VIPERPresenter, MarketPresenterProtocol {
    
    private let goldConverter = GoldValueConverter()
    
    var view: MarketViewProtocol? {
        return controller as? MarketViewProtocol
    }
    
    var marketInteractor: MarketInteractor? {
        let interactora = interactor as? MarketInteractor
        interactora?.delegate = self
        return interactora
    }
    
    func getBaseData() {
        marketInteractor?.getAllData()
    }
    
    func showSearch() {
        guard let router = router as? MarketRouter else { return }
        router.navigate(to: .search)
    }
}

extension MarketPresenter: MarketViewInteractorDelegate {
    
    func handleOutput(_ output: [String : Any]) {
        let source = defineDataSource(output)
        view?.showList(section: source)
    }
}

extension MarketPresenter {
    
    enum Sections {
        case coinCell(data: CoinListElement)
        case currencyCell(title: String, value: Double)
        case titleCell(_ text: String)
        
        var cellHeigth: CGFloat {
            switch self {
            case .coinCell, .currencyCell:
                return 90
            case .titleCell:
                return 50
            }
        }
    }
    
    func defineDataSource(_ data: [String: Any]) -> [Sections] {
        var section = [Sections]()
        
        section.append(.titleCell("Coins"))
        
        if let coin = data["coin"] as? CoinListModel {
            coin.forEach { element in
                section.append(.coinCell(data: element))
            }
        }
        
        if let pop = data["popularCurrency"] as? PopularCurrencyModel {
            section.append(.titleCell("Popular Currencies"))
            
            for element in pop.response ?? [] {
                
                if element.id == "1983" {
                    for goldType in GoldValueConverter.GoldTypes.allCases {
                        let dto = PopularCurrencyData(symbol: goldType.name,
                                                      currentPrice: element.currentPrice)
                        let value = goldConverter.goldSectionSetter(element: dto)
                        section.append(.coinCell(data: value))
                    }
                }else {
                    let element = CoinListElement(id: element.id,
                                                  name: element.symbol,
                                                  currentPrice: Double(element.currentPrice ?? "0"),
                                                  priceChangePercentage24H: Double(element.changePretenge ?? "0"))
                    section.append(.coinCell(data: element))
                }
            }
        }
        
        if let exc = data["currency"] as? CurrencyModel {
            defineCurrencySection(&section, data: exc)
        }
        
        return section
    }
    
    func defineCurrencySection(_ section: inout Array<Sections>, data: CurrencyModel) {
        section.append(.titleCell("Currencies"))
        Array(data.rates ?? [:])
            .sorted(by: <)
            .forEach { (key: String, value: Double) in
                section.append(.currencyCell(title: key, value: value))
            }
    }
}
