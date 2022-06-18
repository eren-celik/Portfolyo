//
//  PortfolyoViewController.swift
//  portfolyo
//
//  Created by Eren  Çelik on 18.06.2022.
//

import UIKit

class PortfolyoViewController: UIViewController {

    var presenter: PortfolyoPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension PortfolyoViewController: PortfolyoViewProtocol {
    
}
