//
//  Market+Interactor.swift
//  portfolyo
//
//  Created by Eren  Çelik on 16.06.2022.
//

import Foundation

final class MarketInteractor: MarketInteractorProtocol {
    
    weak var delegate: MarketViewInteractorDelegate?
    private var manager: NetworkManager<MarketAPI>?
    private var data = [String: Any]()
    private let group = DispatchGroup()
    
    init(manager: NetworkManager<MarketAPI>) {
        self.manager = manager
    }
    
    func getAllData() {
        getCoinList()
        getExchageList()
        group.notify(queue: .main) {
            self.delegate?.handleOutput(self.data)
        }
    }
    
    private func getCurrecyCode() -> String {
        let locale = Locale.current
        return locale.currencyCode ?? ""
    }
    
    func getCoinList() {
        typealias CoinModel = Result<CoinListModel, GUNetworkErrors>
        group.enter()
        manager?.request(target: .coins(perPage: 2, currency: getCurrecyCode()),
                         completion: { [weak self] (result: CoinModel) in
            switch result {
            case .success(let data):
                self?.data["coin"] = data
            case .failure(_):
                self?.delegate?.handleOutput(["err": ""])
            }
            self?.group.leave()
        })
    }
    
    func getExchageList() {
        typealias ExchangeResult = Result<CurrencyModel, GUNetworkErrors>
        group.enter()
        manager?.request(target: .exchanges(currency: getCurrecyCode()),
                         completion: { [weak self] (result: ExchangeResult) in
            switch result {
            case .success(let data):
                self?.data["currency"] = data
            case .failure(_):
                self?.delegate?.handleOutput(["error": ""])
            }
            self?.group.leave()
        })
    }
}
