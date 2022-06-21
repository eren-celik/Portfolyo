//
//  NewsInteractor.swift
//  portfolyo
//
//  Created Eren  Çelik on 6.06.2022.
//  Copyright © 2022. All rights reserved.
//

import Moya

final class NewsInteractor: VIPERInteractor, NewsInteractorInputProtocol {
    
    weak var delegate: NewsViewInteractorDelegate?
    private var manager: NetworkManager<NewsAPI>?
    private var category: String!
    
    init(manager: NetworkManager<NewsAPI>, category: String) {
        self.manager = manager
        self.category = category
    }
    
    required override init() {
        fatalError("init() has not been implemented")
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
}
