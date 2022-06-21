//
//  UIStoryboard+Extension.swift
//  portfolyo
//
//  Created by Eren  Çelik on 21.06.2022.
//

import UIKit

extension UIStoryboard {
    
    func instantiateViewController<T>(ofType type: T.Type) -> T? {
        return self.instantiateViewController(withIdentifier: String(describing: type.self)) as? T
    }
}
