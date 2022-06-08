//
//  NewsPresenter.swift
//  portfolyo
//
//  Created Eren  Çelik on 6.06.2022.
//  Copyright © 2022. All rights reserved.
//

import UIKit

final class NewsPresenter: NewsPresenterProtocol {
    
    private unowned var view: NewsViewProtocol
    private var interactor: NewsInteractorInputProtocol
    private var router: NewsRouterProtocol
    
    init(view: NewsViewProtocol,
         interactor: NewsInteractorInputProtocol,
         router: NewsRouterProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.interactor.delegate = self
    }
    
    func loadNews() {
        interactor.loadNews()
    }
    
    func showDetail(_ news: Article) {
        router.navigate(to: .detail(news))
    }
}

extension NewsPresenter: NewsViewInteractorDelegate {
    
    func handleOutput(_ output: HomeViewInteractorOutput) {
        switch output {
        case .showNews(let news):
            view.showNews(news)
        case .showError(let message):
            view.showErrorMessage(message)
        }
    }
}
