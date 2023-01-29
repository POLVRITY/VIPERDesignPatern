//
//  Router.swift
//  VIPERDesignPattern
//
//  Created by Владислав Белый on 30.01.2023.
//

import Foundation
import UIKit

typealias AnyVC = AnyView & UIViewController

protocol AnyRouter {
    var anyVC: AnyVC? { get }
    
    static func start() -> AnyRouter
}

class UserRouter: AnyRouter {
    var anyVC: AnyVC?
    
    static func start() -> AnyRouter {
        let router = UserRouter()
        
        // Assign VIP
        var view: AnyView = UserViewController()
        var interactor: AnyInteractor = UserInteractor()
        var presenter: AnyPresenter = UserPresenter()
    
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        
        router.anyVC = view as? AnyVC
        
        return router
    }
}
