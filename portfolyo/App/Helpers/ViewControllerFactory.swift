//
//  ViewControllerFactory.swift
//  portfolyo
//
//  Created by Eren  Çelik on 8.06.2022.
//

import UIKit

protocol ViewControllerFactory {
    func createNewsView() -> NewsViewController
}

final class StoryboardViewControllerFactory {
    let storyboard: UIStoryboard
    let manager = NetworkManager()

    init(storyboard: UIStoryboard, manager: NetworkManager) {
        self.storyboard = storyboard
        self.manager = manager
    }
}

extension StoryboardViewControllerFactory: ViewControllerFactory {
    
    func createNewsView() -> NewsViewController {
        let view = storyboard.instantiateViewController(identifier: "NewsViewController") as! NewsViewController
        let router = NewsRouter(view: view)
        let interactor = NewsInteractor(manager: manager)
        let presenter = NewsPresenter(
            view: view,
            interactor: interactor,
            router: router
        )
        view.presenter = presenter
        return view
    }
}
