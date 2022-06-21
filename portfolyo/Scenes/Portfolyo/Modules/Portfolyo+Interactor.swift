//
//  Portfolyo+Interactor.swift
//  portfolyo
//
//  Created by Eren  Çelik on 18.06.2022.
//

import Foundation
import RealmSwift

final class PortfolyoInteractor: VIPERInteractor, PortfolyoInteractorProtocol {
    
    weak var delegate: PortfolyoViewInteractorDelegate?
    private let manager: NetworkManager<MarketAPI>?
    private let realm: RealmManager!
    private let group = DispatchGroup()
    private var data = [String: Any]()
    
    init(manager: NetworkManager<MarketAPI>,
         realmManager: RealmManager) {
        self.manager = manager
        self.realm = realmManager
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    func getPorfolyoData() {
        let id = getUserItems()
        getCoinInfo(coinIDs: id)
        getPopularCurrency()
        group.notify(queue: .main) {
            self.delegate?.handleOutput(self.data)
        }
    }
    
    private func getUserItems() -> [String] {
        group.enter()
        let item = realm.get(fromEntity: PortfolyoRealmModel.self)
        data["userItems"] = item
        group.leave()
        return item.compactMap({ $0.itemId })
    }
    
    private func getCoinInfo(coinIDs: [String]) {
        typealias CoinModel = Result<CoinListModel, GUNetworkErrors>
        group.enter()
        let coins = coinIDs.joined(separator: ",")
        manager?.request(target: .coins(perPage: 10, currency: getCurrecyCode(), coinIDs: coins),
                         completion: { [weak self] (result: CoinModel) in
            switch result {
            case .success(let data):
                self?.data["coinData"] = data
            case .failure(_):
                self?.delegate?.handleOutput(["err": ""])
            }
            self?.group.leave()
        })
    }
    
    private func getPopularCurrency() {
        typealias CurrencyResult = Result<PopularCurrencyModel, GUNetworkErrors>
        group.enter()
        manager?.request(target: .popularCurrency,
                         completion: { [weak self] (result: CurrencyResult) in
            switch result {
            case .success(let data):
                self?.data["popularCurrency"] = data
            case .failure(_):
                self?.delegate?.handleOutput(["error": ""])
            }
            self?.group.leave()
        })
    }
    
    private func getCurrecyCode() -> String {
        let locale = Locale.current
        return locale.currencyCode ?? ""
    }
}
