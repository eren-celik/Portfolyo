//
//  NewsPresenter.swift
//  News
//
//  Created Eren  Çelik on 6.06.2022.
//  Copyright © 2022. All rights reserved.
//

import UIKit

final class NewsPresenter: VIPERPresenter, NewsPresenterProtocol {
    
    var view: NewsViewProtocol? {
        return controller as? NewsViewProtocol
    }
    
    var newsInteractor: NewsInteractor? {
        let interactora = interactor as? NewsInteractor
        interactora?.delegate = self
        return interactora
    }
    
    var newsRouter: NewsRouter? {
        return router as? NewsRouter
    }
    
    func loadNews() {
        newsInteractor?.getNews()
    }
    
    func showDetail(_ news: Article) {
        newsRouter?.navigate(to: .detail(news))
    }
}

extension NewsPresenter: NewsViewInteractorDelegate {
    
    func handleOutput(_ output: HomeViewInteractorOutput) {
        switch output {
        case .showNews(let news):
            view?.showNews(news)
        case .showError(let message):
            view?.showErrorMessage(message)
        }
    }
}
