//
//  PortfolyoViewController.swift
//  portfolyo
//
//  Created by Eren  Çelik on 18.06.2022.
//

import UIKit

final class PortfolyoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viperBuilder: VIPERBuilder<PortfolyoInteractor, PortfolyoPresenter, PortfolyoRouter>!
    
    var sectionList: [PortfolyoPresenter.Sections] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viperBuilder.presenter.preparePortfolyoData()
        setTableView()
        setStyle()
    }
}
