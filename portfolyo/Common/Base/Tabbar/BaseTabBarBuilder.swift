//
//  BaseTabBarBuilder.swift
//  portfolyo
//
//  Created by Eren  Çelik on 14.06.2022.
//

import UIKit

struct BaseTabbarBuilder {
    
    static func build(submodules: TabBarRouter.SubModules) -> UITabBarController {
        let tabs = TabBarRouter.tabs(usingSubmodules: submodules)
        let controller = BaseTabBarController(tabs: tabs)
        return controller
    }
}
