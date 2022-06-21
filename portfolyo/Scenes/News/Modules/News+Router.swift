//
//  NewsRouter.swift
//  portfolyo
//
//  Created Eren  Çelik on 6.06.2022.
//  Copyright © 2022. All rights reserved.
//

import UIKit
import SafariServices

final class NewsRouter: NewsRouterProtocol {
    
    unowned let view: UIViewController

    init(view: UIViewController) {
        self.view = view
    }

    func navigate(to route: NewsViewRoute) {
        switch route {
        case .detail(let article):
            navigateToWeb(article.url ?? "")
        }
    }
    
    private func navigateToWeb(_ url: String) {
        if let url = URL(string: url) {
            let view = SFSafariViewController(url: url)
            self.view.present(view, animated: true, completion: nil)
        }
    }
}
