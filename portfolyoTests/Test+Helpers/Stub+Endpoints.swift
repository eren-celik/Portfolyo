//
//  Stub+Endpoints.swift
//  guTests
//
//  Created by Eren  Çelik on 6.03.2022.
//

import Moya
@testable import portfolyo

struct CustomNetworkEndpoints {
    
    static let successEndpoint: (AppAPI) -> Endpoint =  { (target: AppAPI) -> Endpoint in
        return Endpoint(url: URL(target: target).absoluteString,
                        sampleResponseClosure: { .networkResponse(200, target.sampleData)},
                        method: target.method,
                        task: target.task,
                        httpHeaderFields: target.headers)
    }
    
    static let errorEndpoint: (AppAPI) -> Endpoint =  { (target: AppAPI) -> Endpoint in
        let error = NSError(domain: "com.erenccelik.gu", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid Input"])
        return Endpoint(url: URL(target: target).absoluteString,
                        sampleResponseClosure: { .networkError(error)},
                        method: target.method,
                        task: target.task,
                        httpHeaderFields: target.headers)
    }
    
    static let emptyDataClosure: (AppAPI) -> Endpoint =  { (target: AppAPI) -> Endpoint in
        return Endpoint(url: URL(target: target).absoluteString,
                        sampleResponseClosure: { .networkResponse(204, Data()) },
                        method: target.method,
                        task: target.task,
                        httpHeaderFields: target.headers)
    }
    
    static let networkErrorClosure: (AppAPI) -> Endpoint =  { (target: AppAPI) -> Endpoint in
        return Endpoint(url: URL(target: target).absoluteString,
                        sampleResponseClosure: { .networkResponse(404, Data()) },
                        method: target.method,
                        task: target.task,
                        httpHeaderFields: target.headers)
    }
}

enum StubProvider {
    case succes
    case error
    case empty
    case networkError
    
    var provider: MoyaProvider<AppAPI> {
        switch self {
        case .succes:
            return MoyaProvider<AppAPI>(endpointClosure: CustomNetworkEndpoints.successEndpoint,
                                        stubClosure: MoyaProvider.immediatelyStub)
        case .error:
            return MoyaProvider<AppAPI>(endpointClosure: CustomNetworkEndpoints.errorEndpoint,
                                        stubClosure: MoyaProvider.immediatelyStub)
        case .empty:
            return MoyaProvider<AppAPI>(endpointClosure: CustomNetworkEndpoints.emptyDataClosure,
                                        stubClosure: MoyaProvider.immediatelyStub)
        case .networkError:
            return MoyaProvider<AppAPI>(endpointClosure: CustomNetworkEndpoints.networkErrorClosure,
                                        stubClosure: MoyaProvider.immediatelyStub)
        }
    }
}
