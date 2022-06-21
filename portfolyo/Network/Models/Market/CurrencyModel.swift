//
//  ExchangeModel.swift
//  portfolyo
//
//  Created by Eren  Çelik on 16.06.2022.
//

import Foundation

public struct CurrencyModel: Codable {
    public let amount: Int?
    public let base, date: String?
    public let rates: [String: Double]?
}

public struct PopularCurrencyModel: Codable {
    public let status: Bool?
    public let code: Int?
    public let msg: String?
    public let response: [PopularCurrencyData]?
}

public struct PopularCurrencyData: Codable {
    public var id: String?
    public var high, low: String?
    public var changePretenge: String?
    public var symbol: String?
    public var currentPrice: String?
    public var currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case high = "h"
        case low = "l"
        case currentPrice = "c"
        case changePretenge = "ch"
        case symbol = "s"
        case id
        case currentHoldings
    }
    
    func updateHoldings(amount: Double) -> Self {
        return PopularCurrencyData(id: id,
                                   high: high,
                                   low: low,
                                   changePretenge: changePretenge,
                                   symbol: symbol,
                                   currentPrice: currentPrice,
                                   currentHoldings: amount)
    }
    
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * Double(currentPrice ?? "0.0")!
    }
}
