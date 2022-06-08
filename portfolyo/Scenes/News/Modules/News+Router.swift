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
    
    static func createTodoDetailRouterModule() -> UIViewController {
        let storyBoard = UIStoryboard(name: "News", bundle: nil)
        let view = storyBoard.instantiateViewController(identifier: "NewsViewController") as! NewsViewController
        let router = NewsRouter(view: view)
        let manager = NetworkManager()
        let interactor = NewsInteractor(manager: manager)
        let presenter = NewsPresenter(
            view: view,
            interactor: interactor,
            router: router
        )
        view.presenter = presenter
        return view
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
