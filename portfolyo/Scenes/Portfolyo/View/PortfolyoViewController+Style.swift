//
//  PortfolyoViewController+Style.swift
//  portfolyo
//
//  Created by Eren  Çelik on 18.06.2022.
//

import UIKit.UINavigationController

extension PortfolyoViewController {
    
    func setStyle() {
        setNavigationBar()
    }
    
    func setNavigationBar() {
        let navItem = navigationController?.visibleViewController?.navigationItem
        navItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                      target: self,
                                                      action: #selector(navigateSearch(_:)))
        navigationController?.visibleViewController?.title = "Portfolyo"
    }
    
    @objc
    private func navigateSearch(_ sender: UIBarButtonItem) {
        viperBuilder.presenter.addTransaction()
    }
}
