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
        let newsfactory = StoryboardViewControllerFactory(storyboard: UIStoryboard(name: "Home", bundle: nil))
        let marketfactory = StoryboardViewControllerFactory(storyboard: UIStoryboard(name: "Market", bundle: nil))
        
        let newsViewController = newsfactory.createHomeView()
        let marketViewContoller = marketfactory.createMarketView()
        
        let modules = (
            news: newsViewController,
            market: marketViewContoller
        )
        
        let tabbar = BaseTabbarBuilder.build(submodules: modules)
        tabbar.selectedIndex = 1
        let navigationController = UINavigationController(rootViewController: tabbar)
        navigationController.navigationBar.prefersLargeTitles = true
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
