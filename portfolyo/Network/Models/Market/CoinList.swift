//
//  CoinList.swift
//  portfolyo
//
//  Created by Eren  Çelik on 16.06.2022.
//

import Foundation

typealias CoinListModel = [CoinListElement]

public struct CoinListElement: Codable {
    public var id, symbol, name: String?
    public var image: String?
    public var currentPrice: Double?
    public var marketCap: Int?
    public var priceChange24H, priceChangePercentage24H: Double?
    public var sparklineIn7D: SparklineIn7D?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case sparklineIn7D = "sparkline_in_7d"
        case marketCap = "market_cap"
    }
}

public struct Roi: Codable {
    public var times: Double?
    public var currency: String?
    public var percentage: Double?
}

public struct SparklineIn7D: Codable {
    public var price: [Double]?
}
