//
//  Network+Provider.swift
//  gu
//
//  Created by Eren  Çelik on 4.03.2022.
//

import Moya

enum NewsAPI {
    case everything(keywords: String)
    case topHeadlines(keywords: String)
}

extension NewsAPI: TargetType {
    
    var baseURL: URL {
        switch self {
        case .everything, .topHeadlines:
            return URL(string: Constants.newsBaseURL)!
        }
    }
    
    var path: String {
        switch self {
        case .everything:
            return "/everything"
        case .topHeadlines:
            return "/top-headlines"
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
        case .everything(let keywords):
            return ["language": "tr",
                    "q": keywords]
        case .topHeadlines(let keywords):
            return ["language": "tr",
                    "pageSize": 7,
                    "q": keywords]
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
            return ["Authorization": "a0471ca159db487e853ae61588261cc1"]
        }
    }
    
    var sampleData: Data {
        switch self {
        case .everything:
            return DummyData.news
        default:
            return Data()
        }
    }
}
