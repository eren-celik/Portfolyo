//
//  Market+Presenter.swift
//  portfolyo
//
//  Created by Eren  Çelik on 16.06.2022.
//

import Foundation

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
        case coinCell(title: String, data: CoinListElement)
        case exchangeCelll(title: String, value: Double)
        case textCell(_ text: String)
    }
    
    func defineDataSource(_ data: [String: Any]) -> [Sections] {
        var section = [Sections]()
        
        section.append(.textCell("Coins"))
        
        if let coin = data["coin"] as? CoinListModel {
            coin.forEach { element in
                section.append(.coinCell(title: element.name ?? "", data: element))
            }
        }
        
        section.append(.textCell("Exchages"))
        
        if let exc = data["exchange"] as? ExchangeModel {
            exc.rates?.forEach({ (key: String, value: Double) in
                section.append(.exchangeCelll(title: key, value: value))
            })
        }
        
        return section
    }
}
