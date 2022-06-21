//
//  Search.swift
//  portfolyo
//
//  Created by Eren  Çelik on 16.06.2022.
//

import Foundation

public struct SearchModel: Codable {
    public var coins: [CoinModel]?
}

public struct CoinModel: Codable {
    public var id, name, symbol: String?
    public var marketCapRank: Int?
    public var thumb, large: String?
}
