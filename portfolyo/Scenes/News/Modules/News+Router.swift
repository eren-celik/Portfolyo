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
            if let url = URL(string: article.url ?? "") {
                let view = SFSafariViewController(url: url)
                view.present(view, animated: true, completion: nil)
            }
        }
    }
}
