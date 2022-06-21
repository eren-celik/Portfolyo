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
        let newsViewController = StoryboardedFactory.createView(.home, storyboard: "Home")
        let marketViewContoller = StoryboardedFactory.createView(.market, storyboard: "Market")
        
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
