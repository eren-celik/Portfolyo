//
//  Portfolyo+Router.swift
//  portfolyo
//
//  Created by Eren  Çelik on 18.06.2022.
//

import UIKit

final class PortfolyoRouter: VIPERRouter, PortfolyoRouterProtocol {
    
    func navigate(to route: PortfolyoViewRoute) {
        switch route {
        case .coinDetail:
            let view = StoryboardedFactory.createView(.transaction, storyboard: "Transactions")
            controller?.present(view, animated: true)
            break
        }
    }
}
