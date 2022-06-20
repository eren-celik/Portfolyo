//
//  GoldValueConverter.swift
//  portfolyo
//
//  Created by Eren  Çelik on 20.06.2022.
//

import Foundation

struct GoldValueConverter {
    
    enum GoldTypes: CaseIterable {
        case gramGold
        case quarterGold
        case halfGold
        case cumhurGold
        case onsGold
        
        var name: String {
            switch self {
            case .gramGold:
                return "Gram Altın"
            case .quarterGold:
                return "Çeyrek Altın"
            case .halfGold:
                return "Yarım Altın"
            case .cumhurGold:
                return "Cumhuriyet Altın"
            case .onsGold:
                return "Ons Altın"
            }
        }
    }
    
    func goldSectionSetter(element: PopularCurrencyData) -> CoinListElement {
        let price = Double(element.currentPrice ?? "0.0")!
        let gramPrice = price / 31.1034768
        let elementID = "1983"
        
        var goldPrice = Double()
        var dto = CoinListElement()
        
        for goldType in GoldTypes.allCases where goldType.name == element.symbol {
            switch goldType {
            case .gramGold:
                goldPrice = gramPrice
                dto = CoinListElement(id: elementID,
                                      name: goldType.name,
                                      currentPrice: gramPrice,
                                      currentHoldings: element.currentHoldings)
                
            case .quarterGold:
                goldPrice = (gramPrice * 1.75)
                dto = CoinListElement(id: elementID,
                                      name: goldType.name,
                                      currentPrice: goldPrice,
                                      currentHoldings: element.currentHoldings)
            case .halfGold:
                goldPrice = (gramPrice * 3.6)
                dto = CoinListElement(id: elementID,
                                      name: goldType.name,
                                      currentPrice: (gramPrice * 3.6),
                                      currentHoldings: element.currentHoldings)
            case .cumhurGold:
                goldPrice = (gramPrice * 7)
                dto = CoinListElement(id: elementID,
                                      name: goldType.name,
                                      currentPrice: (gramPrice * 7),
                                      currentHoldings: element.currentHoldings)
            case .onsGold:
                goldPrice = price
                dto = CoinListElement(id: elementID,
                                      name: goldType.name,
                                      currentPrice: price,
                                      currentHoldings: element.currentHoldings)
            }
            return dto
        }
        return dto
    }
}
