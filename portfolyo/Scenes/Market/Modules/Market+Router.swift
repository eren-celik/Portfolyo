//
//  MarketRouter.swift
//  portfolyo
//
//  Created by Eren  Çelik on 16.06.2022.
//

import UIKit

final class MarketRouter: MarketRouterProtocol {
    
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: MarketViewRoute) {
        switch route {
        case .search:
            let searchfactory = StoryboardViewControllerFactory(storyboard: UIStoryboard(name: "Search", bundle: nil))
            let newsViewController = searchfactory.createSeachView()
            view.navigationController?.pushViewController(newsViewController, animated: true)
            break
        }
    }
}
