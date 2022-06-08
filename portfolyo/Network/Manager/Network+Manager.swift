//
//  Network+Manager.swift
//  gu
//
//  Created by Eren  Çelik on 5.03.2022.
//

import Moya

protocol NetworkRequestProtocol: AnyObject {
    associatedtype T: TargetType
    func request<D: Decodable>(target: T, completion: @escaping (Result<D, GUNetworkErrors>) -> Void)
}

final class NetworkManager<T: TargetType> {
    var provider: MoyaProvider<T>
    
    init(provider: MoyaProvider<T>) {
        self.provider = provider
    }
}


extension NetworkManager: NetworkRequestProtocol {
    
    func request<D: Decodable>(target: T, completion: @escaping (Result<D, GUNetworkErrors>) -> Void) {
        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                guard response.statusCode >= 200 && response.statusCode <= 300 else {
                    completion(.failure(.networkError(code: response.statusCode)))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(D.self, from: response.data)
                    completion(.success(result))
                }catch {
                    completion(.failure(.decodeError))
                }
                break
            case .failure(let error):
                completion(.failure(.invalidResponse(message: error.localizedDescription)))
            }
        }
    }
}
