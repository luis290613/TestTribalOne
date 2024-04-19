//
//  NewProtocol.swift
//  MediaBrands
//
//  Created by Diego on 12/02/24.
//

import UIKit

// MARK: VIEW
protocol NewViewProtocol : AnyObject {
    var presenter: NewViewPresenterProtocol? { get set }
    func showLoader()
    func hideLoader()
    func success(item: [ItemChiste])
    func errorService(message: String)
}

// MARK: PRESENTER
typealias NewPresenterProtocol = NewViewPresenterProtocol & NewInteractorPresenterProtocol
// view - presenter
protocol NewViewPresenterProtocol : AnyObject {
    var interactor: NewInteractorProtocol? { get set }
    var view: NewViewProtocol? { get set }
    var router: NewRouterProtocol?  { get set }
    func loadService()
    
}
// interactor - presenter
protocol NewInteractorPresenterProtocol : AnyObject {
    func success(item: [ChisteResponse])
    func failure(error: String)
}

// MARK: INTERACTOR
protocol NewInteractorProtocol : AnyObject {
    var presenter: NewInteractorPresenterProtocol? { get set }
    func loadService()
}

// MARK: ROUTER
protocol NewRouterProtocol : AnyObject {
    var viewController : UIViewController? { get set }
}
