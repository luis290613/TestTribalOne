//
//  NewInteractor.swift
//  MediaBrands
//
//  Created by Diego on 12/02/24.
//

import Foundation
import Alamofire

class NewInteractor {
    weak var presenter: NewInteractorPresenterProtocol?
    
}

extension NewInteractor : NewInteractorProtocol {
    
    
    func loadService() {
        
        var cantidad = 15
        var resultados: [ChisteResponse] = []
        
        let url : String = "https://api.chucknorris.io/jokes/random"
        
        for _ in 1...cantidad {
            AF.request(url, method: .get)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: ChisteResponse.self) { [weak self] response in
                    guard let self else { return }
                    switch response.result {
                    case .success(let response):
                        resultados.append(response)
                        
                        if resultados.count == cantidad {
                            self.presenter?.success(item: resultados)
                        }
                    case .failure(_):
                        self.presenter?.failure(error: "Sucedio un error, ponerse en contacto con el administrador")
                    }
                }
        }
    }
}
