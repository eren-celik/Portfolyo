//
//  NewsInteractor.swift
//  portfolyo
//
//  Created Eren  Çelik on 6.06.2022.
//  Copyright © 2022. All rights reserved.
//

import Moya

final class NewsInteractor: NewsInteractorInputProtocol {
    
    weak var delegate: NewsViewInteractorDelegate?
    private var manager: NetworkManager<AppAPI>?
    private var category: String!
    
    init(manager: NetworkManager<AppAPI>, category: String) {
        self.manager = manager
        self.category = category
    }
    
    func getNews() {
        manager?.request(target: .everything(keywords: category)) { [weak self] (result: Result<NewsModel, GUNetworkErrors>) in
            switch result {
            case .success(let data):
                self?.delegate?.handleOutput(.showNews(data.articles ?? []))
            case .failure(let error):
                self?.delegate?.handleOutput(.showError(error.localizedDescription))
            }
        }
    }
    
    func showDetail(_ news: Article) {
        print("shooo")
    }
}
