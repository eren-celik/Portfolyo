//
//  ViewControllerFactory.swift
//  portfolyo
//
//  Created by Eren  Çelik on 8.06.2022.
//

import Moya

final class StoryboardViewControllerFactory {
    let storyboard: UIStoryboard
    let manager = NetworkManager<AppAPI>(provider: MoyaProvider<AppAPI>())
    
    init(storyboard: UIStoryboard) {
        self.storyboard = storyboard
    }
}

extension StoryboardViewControllerFactory {
    
    func createNewsView(category: String) -> NewsViewController {
        let view = storyboard.instantiateViewController(identifier: "NewsViewController") as! NewsViewController
        let router = NewsRouter(view: view)
        let interactor = NewsInteractor(manager: manager, category: category)
        let presenter = NewsPresenter(
            view: view,
            interactor: interactor,
            router: router
        )
        view.presenter = presenter
        return view
    }
    
    func createWalletView() -> WalletViewController {
        let view = storyboard.instantiateViewController(identifier: "WalletViewController") as! WalletViewController
        return view
    }
    
    func createHomeView() -> HomeViewController {
        let view = storyboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        return view
    }
}
