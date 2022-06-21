//
//  ViewControllerFactory.swift
//  portfolyo
//
//  Created by Eren  Çelik on 8.06.2022.
//

import Moya

struct StoryboardedFactory {
    
    static func createView(_ parent: ViewType, storyboard name: String) -> UIViewController {
        let viperBuilder = ViewViperBuilder()
        let storyboard = UIStoryboard(name: name, bundle: nil)
        
        guard let view = storyboard.instantiateViewController(ofType: parent.view) else {
            return UIViewController()
        }
        
        switch parent {
        case .market:
            viperBuilder.createMarketView(view)
        case .transaction:
            viperBuilder.createTransactionView(view)
        case .portfolyo:
            viperBuilder.createPortfolyoView(view)
        case .news(let category):
            viperBuilder.createNewsView(view, category: category)
        default:
            break
        }
        
        return view
    }
}

struct ViewViperBuilder {
    let manager = NetworkManager<MarketAPI>(provider: MoyaProvider<MarketAPI>())
    let realmManager: RealmManager = RealmManager()
    
    func createMarketView(_ view: UIViewController) {
        guard let view = view as? MarketViewController else { return }
        let interactor = MarketInteractor(manager: manager)
        let viperBuilder: VIPERBuilder<MarketInteractor, MarketPresenter, MarketRouter> = VIPERBuilder(controller: view, interactor: interactor)
        view.viperBuilder = viperBuilder
    }
    
    func createTransactionView(_ view: UIViewController) {
        guard let view = view as? TransactionsViewController else { return }
        let interactor = TransactionsInteractor(manager: manager)
        let viperBuilder: VIPERBuilder<TransactionsInteractor, TransactionsPresenter, TransactionsRouter> = VIPERBuilder(controller: view, interactor: interactor)
        view.viperBuilder = viperBuilder
    }
    
    func createPortfolyoView(_ view: UIViewController) {
        guard let view = view as? PortfolyoViewController else { return }
        let interactor = PortfolyoInteractor(manager: manager, realmManager: realmManager)
        let viperBuilder: VIPERBuilder<PortfolyoInteractor, PortfolyoPresenter, PortfolyoRouter> = VIPERBuilder(controller: view, interactor: interactor)
        view.viperBuilder = viperBuilder
    }
    
    func createNewsView(_ view: UIViewController, category: String) {
        guard let view = view as? NewsViewController else { return }
        let manager = NetworkManager<NewsAPI>(provider: MoyaProvider<NewsAPI>())
        let interactor = NewsInteractor(manager: manager, category: category)
        let viperBuilder: VIPERBuilder<NewsInteractor, NewsPresenter, NewsRouter> = VIPERBuilder(controller: view, interactor: interactor)
        view.viperBuilder = viperBuilder
    }
}
