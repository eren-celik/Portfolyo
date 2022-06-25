//
//  NewsRouter.swift
//  portfolyo
//
//  Created Eren  Çelik on 6.06.2022.
//  Copyright © 2022. All rights reserved.
//

import UIKit
import SafariServices

final class NewsRouter: VIPERRouter, NewsRouterProtocol {
    
    func navigate(to route: NewsViewRoute) {
        switch route {
        case .detail(let article):
            navigateToWeb(article.url ?? "")
        }
    }
    
    private func navigateToWeb(_ url: String) {
        if let url = URL(string: url) {
            let view = SFSafariViewController(url: url)
            controller?.present(view, animated: true, completion: nil)
        }
    }
}
