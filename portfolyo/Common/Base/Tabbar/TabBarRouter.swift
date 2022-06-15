//
//  TabBarRouter.swift
//  portfolyo
//
//  Created by Eren  Çelik on 14.06.2022.
//

import UIKit

final class TabBarRouter {
    
    var viewController: UIViewController
    
    typealias SubModules = (
        news: HomeViewController,
        wallet: WalletViewController
    )
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension TabBarRouter {
    
    static func tabs(usingSubmodules submodules: SubModules) -> BaseTabs {
        let newsItem = UITabBarItem(title: "News", image: UIImage(systemName: "house.fill"), tag: 0)
        let walletItem = UITabBarItem(title: "Wallet", image: UIImage(systemName: "creditcard.fill"), tag: 1)
        
        submodules.news.tabBarItem = newsItem
        submodules.wallet.tabBarItem = walletItem
        
        return (
            news: submodules.news,
            wallet: submodules.wallet
        )
    }
}
