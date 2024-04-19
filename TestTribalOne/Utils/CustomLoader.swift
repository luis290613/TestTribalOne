//
//  CustomLoader.swift
//  TestTribalOne
//
//  Created by Diego on 19/04/24.
//

import UIKit
import SnapKit

class CustomLoader {

    static let shared = CustomLoader()
    
    private let activityIndicator: UIActivityIndicatorView = {
       let indicator = UIActivityIndicatorView(style: .large)
        indicator.backgroundColor = .white
        indicator.layer.cornerRadius = 4
        return indicator
    }()
    
    private init() {
    }

    func showLoader(in view: UIView) {
        view.addSubview(self.activityIndicator)
        self.activityIndicator.snp.makeConstraints { make in
            make.height.width.equalTo(70)
            make.center.equalToSuperview()
        }
        self.activityIndicator.startAnimating()
    }
    
    func hideLoader() {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.removeFromSuperview()
    }
}
