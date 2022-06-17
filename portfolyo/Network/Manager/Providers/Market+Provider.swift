//
//  Market+Provider.swift
//  portfolyo
//
//  Created by Eren  Çelik on 16.06.2022.
//

import Moya

enum MarketAPI {
    case coins(perPage: Int, currency: String)
    case search(keyword: String)
    case exchanges(currency: String)
}

extension MarketAPI: TargetType {
    
    var baseURL: URL {
        switch self {
        case .exchanges:
            return URL(string: "https://api.frankfurter.app")!
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
        case .coins(let perPage, let currency):
            return ["vs_currency": currency,
                    "order": "market_cap_desc",
                    "per_page": perPage,
                    "page": 1,
                    "sparkline": "false"]
        case .search(let keyword):
            return ["query": keyword]
        case .exchanges(let currency):
            return ["from": currency]
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

