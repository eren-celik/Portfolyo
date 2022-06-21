//
//  ViperBuilder.swift
//  portfolyo
//
//  Created by Eren  Çelik on 21.06.2022.
//

import UIKit

class VIPERInteractor: NSObject {
    required override init() {
        super.init()
    }
}

class VIPERPresenter: NSObject {
    weak var controller: UIViewController?
    weak var interactor: VIPERInteractor?
    weak var router: VIPERRouter?
    
    required override init() {
        super.init()
    }
}

class VIPERRouter: NSObject {
    weak var controller: UIViewController?
    private(set) weak var navController: UINavigationController?
    
    required override init() {
        super.init()
    }
}

class VIPERBuilder<I: VIPERInteractor, P: VIPERPresenter, R: VIPERRouter>: NSObject {
    public let interactor: I
    public let presenter: P
    public let router: R
    
    public init(controller: UIViewController,
                interactor: I = I(),
                presenter: P = P(),
                router: R = R()) {
        self.interactor = interactor
        self.presenter = presenter
        self.router = router
        super.init()
        
        VIPERBuilder.setupVIPER(controller: controller,
                                interactor: interactor,
                                presenter: presenter,
                                router: router)
    }
    
    static func setupVIPER(controller: UIViewController,
                           interactor: VIPERInteractor,
                           presenter: VIPERPresenter,
                           router: VIPERRouter) {
        presenter.interactor = interactor
        presenter.controller = controller
        presenter.router = router
        
        router.controller = controller
    }
}
