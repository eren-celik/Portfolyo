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
    public var marketCap, marketCapRank: Int?
    public var fullyDilutedValuation: Int?
    public var totalVolume: Int?
    public var high24H, low24H, priceChange24H, priceChangePercentage24H: Double?
    public var marketCapChange24H, marketCapChangePercentage24H, circulatingSupply: Double?
    public var totalSupply, maxSupply: Double?
    public var ath, athChangePercentage: Double?
    public var athDate: String?
    public var atl, atlChangePercentage: Double?
    public var atlDate: String?
    public var roi: Roi?
    public var lastUpdated: String?
    public var sparklineIn7D: SparklineIn7D?
}

public struct Roi: Codable {
    public var times: Double?
    public var currency: String?
    public var percentage: Double?
}

public struct SparklineIn7D: Codable {
    public var price: [Double]?
}
