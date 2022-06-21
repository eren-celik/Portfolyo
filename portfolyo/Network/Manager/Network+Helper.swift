//
//  Network+Helper.swift
//  portfolyo
//
//  Created by Eren  Çelik on 6.06.2022.
//

import Foundation

enum GUNetworkErrors: Error {
    
    case invalidResponse(message: String)
    case decodeError
    case networkError(code: Int)
    
    var localizedDescription: String {
        switch self {
        case .invalidResponse(let message):
            return "Invalid Response: \(message)"
        case .decodeError:
            return "Decode Error"
        case .networkError(let code):
            return "Network Error Code:\(code)"
        }
    }
}
