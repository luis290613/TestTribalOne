//
//  NewRouter.swift
//  MediaBrands
//
//  Created by Diego on 12/02/24.
//

import Foundation
import UIKit

class NewRouter {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let viewController = NewViewController()
        let interactor : NewInteractorProtocol = NewInteractor()
        let presenter : NewPresenterProtocol = NewPresenter()
        let router : NewRouterProtocol = NewRouter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = viewController
        
        return viewController
    }
    
}

extension NewRouter : NewRouterProtocol {
    
}

