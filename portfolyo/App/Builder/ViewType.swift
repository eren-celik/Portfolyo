//
//  ViewType.swift
//  portfolyo
//
//  Created by Eren  Çelik on 21.06.2022.
//

import UIKit.UIView

enum ViewType {
    case market
    case news(category: String)
    case home
    case portfolyo
    case search
    case transaction
    
    var view: UIViewController.Type {
        switch self {
        case .market:
            return MarketViewController.self
        case .news:
            return NewsViewController.self
        case .home:
            return HomeViewController.self
        case .portfolyo:
            return PortfolyoViewController.self
        case .search:
            return SearchViewController.self
        case .transaction:
            return TransactionsViewController.self
        }
    }
}
