//
//  NewsViewController+Style.swift
//  portfolyo
//
//  Created by Eren  Çelik on 15.06.2022.
//

import Foundation

extension NewsViewController {
    
    internal func setupStyle() {
        setNavigation()
    }
    
    func setNavigation() {
        navigationController?.visibleViewController?.title = "Haberler"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
