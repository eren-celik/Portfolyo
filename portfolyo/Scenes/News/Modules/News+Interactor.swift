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
    
    init(manager: NetworkManager<AppAPI>) {
        self.manager = manager
    }
    
    func getNews(keywords: String) {
        manager?.request(target: .everything(keywords: keywords)) { [weak self] (result: Result<[NewsModel], GUNetworkErrors>) in
            switch result {
            case .success(let data):
                
                self?.delegate?.handleOutput(.showNews(data.first?.articles ?? []))
            case .failure(let error):
                self?.delegate?.handleOutput(.showError(error.localizedDescription))
            }
        }
    }
    
    func showDetail(_ news: Article) {
        print("shooo")
    }
}
