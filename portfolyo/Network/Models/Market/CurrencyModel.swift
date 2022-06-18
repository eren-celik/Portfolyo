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
    public let data: [CurrencyData]?
}

public struct CurrencyData: Codable {
    public let aciklama: String?
    public let yuzdedegisim: Double?
    public let yuksek, dusuk: Double?
    public let alis, satis: Double?
    
    enum CodingKeys: String, CodingKey {
        case aciklama = "ACIKLAMA"
        case yuzdedegisim = "YUZDEDEGISIM"
        case yuksek = "YUKSEK"
        case dusuk = "DUSUK"
        case alis = "ALIS"
        case satis = "SATIS"
    }
}
