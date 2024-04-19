//
//  NewPresenter.swift
//  MediaBrands
//
//  Created by Diego on 12/02/24.
//

import Foundation

class NewPresenter {
    var interactor: NewInteractorProtocol?
    weak var view: NewViewProtocol?
    var router: NewRouterProtocol?
}

extension NewPresenter: NewPresenterProtocol {
    
    func loadService() {
        view?.showLoader()
        interactor?.loadService()
    }
    
    func success(item: [ChisteResponse]) {
        view?.hideLoader()
        view?.success(item: item.map { ItemChiste(id: $0.id, image: $0.iconURL, title: $0.value) })
    }
    
    func failure(error: String) {
        view?.hideLoader()
        view?.errorService(message: error)
    }
}
