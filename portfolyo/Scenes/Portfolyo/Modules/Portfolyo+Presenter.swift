//
//  Portfolyo+Presenter.swift
//  portfolyo
//
//  Created by Eren  Çelik on 18.06.2022.
//

import UIKit
import RealmSwift

final class PortfolyoPresenter: PortfolyoPresenterProtocol {
    
    private unowned var view: PortfolyoViewProtocol?
    private var interactor: PortfolyoInteractorProtocol
    private var router: PortfolyoRouterProtocol
    
    init(view: PortfolyoViewProtocol,
         interactor: PortfolyoInteractorProtocol,
         router: PortfolyoRouterProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.interactor.delegate = self
    }
    
    func preparePortfolyoData() {
        interactor.getPorfolyoData()
    }
}

extension PortfolyoPresenter: PortfolyoViewInteractorDelegate {
    
    func handleOutput(_ output: [String: Any]) {
        let sec = defineDataSource(output)
        view?.showList(section: sec)
    }
}

extension PortfolyoPresenter {
    
    enum Sections {
        case itemCell(data: CoinListElement)
        case titleCell(_ text: String)
        case graphCell(_ data: [Double])
        
        var cellHeigth: CGFloat {
            switch self {
            case .itemCell:
                return 90
            case .graphCell:
                return 300
            case .titleCell:
                return 50
            }
        }
    }
    
    func defineDataSource(_ data: [String: Any]) -> [Sections] {
        var section = [Sections]()
        
        guard let coinItems = data["coinData"] as? CoinListModel else {
            section.append(.titleCell("Data Bulunamadı"))
            return section
        }
        
        if let items = data["userItems"] as? Results<PortfolyoRealmModel>{
            var arr = [Double]()
            items.forEach { model in
                arr.append(contentsOf: model.sparkline.toArray())
            }
            section.append(.graphCell(arr))
        }
        
        section.append(.titleCell("Varlıklar"))
        
        coinItems.forEach { element in
            section.append(.itemCell(data: element))
        }
        
        
        return section
    }
}
