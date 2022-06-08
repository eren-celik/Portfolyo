//
//  NewsInteractor.swift
//  portfolyo
//
//  Created Eren  Çelik on 6.06.2022.
//  Copyright © 2022. All rights reserved.
//

import UIKit

final class NewsInteractor: NewsInteractorInputProtocol {
    
    weak var delegate: NewsViewInteractorDelegate?
    private var manager: NetworkManager?
    
    init(manager: NetworkManager) {
        self.manager = manager
    }
    
    func loadNews() {
        manager?.request(target: .everything(keywords: "apple")) { [weak self] (result: Result<NewsModel, GUNetworkErrors>) in
            switch result {
            case .success(let data):
                print(data)
                if data.articles?.isEmpty == false {
                    self?.delegate?.handleOutput(.showNews(data.articles!))
                }else if data.status == "error" {
                    self?.delegate?.handleOutput(.showError(data.message ?? ""))
                }
            case .failure(let error):
                self?.delegate?.handleOutput(.showError(error.localizedDescription))
            }
        }
    }
    
    func showDetail(_ news: Article) {
        print("shooo")
    }
    
}
