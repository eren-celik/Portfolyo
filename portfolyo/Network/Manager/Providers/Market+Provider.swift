//
//  Market+Provider.swift
//  portfolyo
//
//  Created by Eren  Çelik on 16.06.2022.
//

import Moya

enum MarketAPI {
    case coins(perPage: Int)
}

extension MarketAPI: TargetType {
    
    var baseURL: URL {
        switch self {
        case .coins:
            return URL(string: Constants.coinMarketBaseURL)!
        }
    }
    
    var path: String {
        switch self {
        case .coins:
            return "coins/markets"
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
        case .coins(let perPage):
            return ["vs_currency": "try",
                    "order": "market_cap_desc",
                    "per_page": perPage,
                    "page": 1,
                    "sparkline": "false"]
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

