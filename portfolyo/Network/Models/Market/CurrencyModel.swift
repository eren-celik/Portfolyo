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
