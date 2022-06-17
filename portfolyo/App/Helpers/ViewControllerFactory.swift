//
//  ViewControllerFactory.swift
//  portfolyo
//
//  Created by Eren  Çelik on 8.06.2022.
//

import Moya

final class StoryboardViewControllerFactory {
    let storyboard: UIStoryboard
    let manager = NetworkManager<NewsAPI>(provider: MoyaProvider<NewsAPI>())
    
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
    
    func createMarketView() -> MarketViewController {
        let view = storyboard.instantiateViewController(identifier: "MarketViewController") as! MarketViewController
        let manager = NetworkManager<MarketAPI>(provider: MoyaProvider<MarketAPI>())
        let router = MarketRouter(view: view)
        let interactor = MarketInteractor(manager: manager)
        let presenter = MarketPresenter(
            view: view,
            interactor: interactor,
            router: router
        )
        view.presenter = presenter
        return view
    }
    
    func createHomeView() -> HomeViewController {
        let view = storyboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        return view
    }
    
    func createSeachView() -> SearchViewController {
        let view = storyboard.instantiateViewController(identifier: "SearchViewController") as! SearchViewController
        let manager = NetworkManager<MarketAPI>(provider: MoyaProvider<MarketAPI>())
        let router = SearchRouter(view: view)
        let interactor = SearchInteractor(manager: manager)
        let presenter = SearchPresenter(
            view: view,
            interactor: interactor,
            router: router
        )
        view.presenter = presenter
        return view
    }
}
