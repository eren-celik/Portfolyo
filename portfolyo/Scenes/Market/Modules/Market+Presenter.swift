//
//  Market+Presenter.swift
//  portfolyo
//
//  Created by Eren  Çelik on 16.06.2022.
//

import UIKit

final class MarketPresenter: MarketPresenterProtocol {
    
    private unowned var view: MarketViewProtocol
    private var interactor: MarketInteractorProtocol
    private var router: MarketRouterProtocol
    
    init(view: MarketViewProtocol,
         interactor: MarketInteractorProtocol,
         router: MarketRouterProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.interactor.delegate = self
    }
    
    func getBaseData() {
        interactor.getAllData()
    }
    
    func showSearch() {
        router.navigate(to: .search)
    }
}

extension MarketPresenter: MarketViewInteractorDelegate {
    
    func handleOutput(_ output: [String : Any]) {
        let source = defineDataSource(output)
        view.showList(section: source)
    }
}

extension MarketPresenter {
    
    enum Sections {
        case coinCell(data: CoinListElement)
        case currencyCell(title: String, value: Double)
        case textCell(_ text: String)
        
        var cellHeigth: CGFloat {
            switch self {
            case .coinCell, .currencyCell:
                return 90
            case .textCell:
                return 50
            }
        }
    }
    
    func defineDataSource(_ data: [String: Any]) -> [Sections] {
        var section = [Sections]()
        
        section.append(.textCell("Coins"))
        
        if let coin = data["coin"] as? CoinListModel {
            coin.forEach { element in
                section.append(.coinCell(data: element))
            }
        }
        
        if let pop = data["popularCurrency"] as? PopularCurrencyModel {
            section.append(.textCell("Popular Currencies"))
            
            for element in pop.response ?? [] {
                let element = CoinListElement(name: element.symbol,
                                              currentPrice: Double(element.currentPrice ?? "0"),
                                              priceChangePercentage24H: Double(element.changePretenge ?? "0"))
                section.append(.coinCell(data: element))
            }
        }
        
        if let exc = data["currency"] as? CurrencyModel {
            defineCurrencySection(&section, data: exc)
        }
        
        return section
    }
    
    func defineCurrencySection(_ section: inout Array<Sections>, data: CurrencyModel) {
        section.append(.textCell("Currencies"))
        Array(data.rates ?? [:])
            .sorted(by: <)
            .forEach { (key: String, value: Double) in
                section.append(.currencyCell(title: key, value: value))
            }
    }
}
