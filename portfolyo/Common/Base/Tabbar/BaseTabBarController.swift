//
//  BaseTabBarController.swift
//  portfolyo
//
//  Created by Eren  Çelik on 14.06.2022.
//

import UIKit

typealias BaseTabs = (
    news: NewsViewController,
    wallet: WalletViewController
)

final class BaseTabBarController: UITabBarController {

    init(tabs: BaseTabs) {
        super.init(nibName: nil, bundle: nil)
        viewControllers = [tabs.news, tabs.wallet]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
