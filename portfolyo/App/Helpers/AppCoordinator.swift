//
//  AppCoordinator.swift
//  portfolyo
//
//  Created by Eren  Çelik on 8.06.2022.
//

import UIKit

final class AppCoordinator {
    
    unowned let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let newsfactory = StoryboardViewControllerFactory(storyboard: UIStoryboard(name: "News", bundle: nil))
        let walletfactory = StoryboardViewControllerFactory(storyboard: UIStoryboard(name: "Wallet", bundle: nil))
        
        let newsViewController = newsfactory.createNewsView()
        let walletViewContoller = walletfactory.createWalletView()
        
        let modules = (
            news: newsViewController,
            wallet: walletViewContoller
        )
        
        let tabbar = BaseTabbarBuilder.build(submodules: modules)
        let navigationController = UINavigationController(rootViewController: tabbar)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
