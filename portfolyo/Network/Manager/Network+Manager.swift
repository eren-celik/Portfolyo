//
//  Network+Manager.swift
//  gu
//
//  Created by Eren  Çelik on 5.03.2022.
//

import Moya

final class NetworkManager {
    typealias TargetType = AppAPI
    var provider: MoyaProvider<AppAPI>
    
    init(provider: MoyaProvider<TargetType> = MoyaProvider<TargetType>()) {
        self.provider = provider
    }
}

//MARK: - General Request Extension

extension NetworkManager: NetworkRequestProtocol {
    
    func request<T: Decodable>(target: TargetType, completion: @escaping (Result<T, GUNetworkErrors>) -> Void) {
        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                guard response.statusCode >= 200 && response.statusCode <= 300 else {
                    completion(.failure(.networkError(code: response.statusCode)))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(T.self, from: response.data)
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
