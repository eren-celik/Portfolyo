//
//  Network+Contracts.swift
//  gu
//
//  Created by Eren  Çelik on 5.03.2022.
//

import Moya
import Alamofire

protocol NetworkLayerProtocol {
    
    associatedtype T: TargetType
    var provider: MoyaProvider<T> { get }
}

protocol NetworkRequestProtocol: AnyObject {
    associatedtype Target: TargetType
    
    func request<T: Decodable>(target: Target, completion: @escaping (Result<T, GUNetworkErrors>) -> Void)
}
