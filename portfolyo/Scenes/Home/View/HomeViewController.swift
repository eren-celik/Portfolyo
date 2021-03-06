//
//  HomeViewController.swift
//  portfolyo
//
//  Created by Eren  Çelik on 14.06.2022.
//

import UIKit
import Parchment

final class HomeViewController: UIViewController {

    @IBOutlet weak var pagingView: UIView!
    
    let categories = [
        "Altın", "Döviz", "Borsa", "Ekonomi", "Gündem"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setParchment()
    }
    
    private func setParchment() {
        let pagingViewController = PagingViewController()
        addChild(pagingViewController)
        pagingView.addSubview(pagingViewController.view)
        pagingView.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
        pagingViewController.dataSource = self
        pagingViewController.menuItemSize = .selfSizing(estimatedWidth: 100, height: 40)
    }
}

extension HomeViewController: PagingViewControllerDataSource {
    
    func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
        return PagingIndexItem(index: index, title: categories[index])
    }
    
    func numberOfViewControllers(in pagingViewController: PagingViewController) -> Int {
        return categories.count
    }
    
    func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {
        let data = categories[index]
        let viewController = StoryboardedFactory.createView(.news(category: data), storyboard: "News")
        return viewController
    }
}
