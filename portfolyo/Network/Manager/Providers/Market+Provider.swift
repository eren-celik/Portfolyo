//
//  Market+Provider.swift
//  portfolyo
//
//  Created by Eren  Çelik on 16.06.2022.
//

import Moya

enum MarketAPI {
    case coins(perPage: Int)
    case search(keyword: String)
}

extension MarketAPI: TargetType {
    
    var baseURL: URL {
        switch self {
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
        case .search(let keyword):
            return ["query": keyword]
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

