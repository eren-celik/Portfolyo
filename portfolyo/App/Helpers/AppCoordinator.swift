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
        let factory = StoryboardViewControllerFactory(storyboard: UIStoryboard(name: "News", bundle: nil))
        let viewController = factory.createNewsView()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
