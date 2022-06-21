//
//  Market+Provider.swift
//  portfolyo
//
//  Created by Eren  Çelik on 16.06.2022.
//

import Moya

enum MarketAPI {
    case coins(perPage: Int, currency: String, coinIDs: String)
    case search(keyword: String)
    case exchanges(currency: String)
    case popularCurrency
}

extension MarketAPI: TargetType {
    
    var baseURL: URL {
        switch self {
        case .exchanges:
            return URL(string: "https://api.frankfurter.app")!
        case .popularCurrency:
            return URL(string: "https://fcsapi.com/api-v3/forex/latest")!
        default:
            return URL(string: Constants.coinMarketBaseURL)!
        }
    }
    
    var path: String {
        switch self {
        case .coins:
            return "/coins/markets"
        case .search:
            return "/search"
        case .exchanges:
            return "/latest"
        case .popularCurrency:
            return "/doviz/headerlist/"
        }
    }
    
    var method: Method {
        switch self {
        default:
            return .get
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .coins(let perPage, let currency, let coinIDs):
            return ["vs_currency": currency,
                    "order": "market_cap_desc",
                    "ids": coinIDs,
                    "per_page": perPage,
                    "page": 1,
                    "sparkline": "true"]
        case .search(let keyword):
            return ["query": keyword]
        case .exchanges(let currency):
            return ["from": currency]
        case .popularCurrency:
            return ["symbol": "USD/TRY,EUR/TRY,GBP/TRY,CAD/TRY",
                    "access_key": "1wnBEfw8liiUNVhGLNYZVtBN"]
        }
    }
    
    var task: Task {
        switch self {
        default:
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        default:
            return [:]
        }
    }
    
    var sampleData: Data {
        switch self {
        default:
            return Data()
        }
    }
}

