//
//  Portfolyo+Interactor.swift
//  portfolyo
//
//  Created by Eren  Çelik on 18.06.2022.
//

import Foundation
import RealmSwift

final class PortfolyoInteractor: PortfolyoInteractorProtocol {
    
    weak var delegate: PortfolyoViewInteractorDelegate?
    private var manager: NetworkManager<MarketAPI>?
    private let group = DispatchGroup()
    private var data = [String: Any]()
    
    init(manager: NetworkManager<MarketAPI>) {
        self.manager = manager
    }
    
    func getPorfolyoData() {
        let id = getUserItems()
        getCoinInfo(coinIDs: id)
        
        group.notify(queue: .main) {
            self.delegate?.handleOutput(self.data)
        }
    }
    
    private func getUserItems() -> [String] {
        group.enter()
        let item = RealmManager.get(fromEntity: PortfolyoRealmModel.self)
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
    
    private func getCurrecyCode() -> String {
        let locale = Locale.current
        return locale.currencyCode ?? ""
    }
}
