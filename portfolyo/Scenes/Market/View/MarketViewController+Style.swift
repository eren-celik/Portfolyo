//
//  MarketViewController+Style.swift
//  portfolyo
//
//  Created by Eren  Çelik on 16.06.2022.
//

import UIKit

extension MarketViewController {
    
    func setStyle() {
        
    }
    
    func setNavigationBar() {
        let navItem = navigationController?.visibleViewController?.navigationItem
        navItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                      target: self,
                                                      action: #selector(navigateSearch(_:)))
        navigationController?.visibleViewController?.title = "Wallet"
    }
    
    func resetNavigationBar() {
        let navItem = navigationController?.visibleViewController?.navigationItem
        navItem?.rightBarButtonItem = nil
    }
    
    @objc
    private func navigateSearch(_ sender: UIBarButtonItem) {
        presenter.showSearch()
    }
}
