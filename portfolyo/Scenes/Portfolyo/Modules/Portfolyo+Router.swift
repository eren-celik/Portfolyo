//
//  Portfolyo+Router.swift
//  portfolyo
//
//  Created by Eren  Çelik on 18.06.2022.
//

import UIKit

final class PortfolyoRouter: PortfolyoRouterProtocol {
    
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: PortfolyoViewRoute) {
        switch route {
        case .coinDetail:
            break
        }
    }
}
