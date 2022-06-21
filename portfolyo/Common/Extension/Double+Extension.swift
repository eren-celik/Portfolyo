//
//  Double+Extension.swift
//  portfolyo
//
//  Created by Eren  Çelik on 20.06.2022.
//

import UIKit

extension Double {
    
    func convertPrice() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let price = NSNumber(value: self)
        return formatter.string(from: price)!
    }
}
