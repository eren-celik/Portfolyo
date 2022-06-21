//
//  MarketRouter.swift
//  portfolyo
//
//  Created by Eren  Çelik on 16.06.2022.
//

import UIKit

final class MarketRouter: VIPERRouter, MarketRouterProtocol {
    
    func navigate(to route: MarketViewRoute) {
        switch route {
        case .search:
            let searchfactory = StoryboardedFactory("Portfolyo")
            let newsViewController = searchfactory.createPortfolyoView()
            controller?.navigationController?.pushViewController(newsViewController, animated: true)
            break
        }
    }
}
