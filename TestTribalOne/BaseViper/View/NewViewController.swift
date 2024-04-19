//
//  NewViewController.swift
//  MediaBrands
//
//  Created by Diego on 12/02/24.
//

import UIKit
import SnapKit

class NewViewController: UIViewController {
    var presenter: NewViewPresenterProtocol?
    
    var listChist: [ItemChiste] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lista de chistes"
        view.backgroundColor = .white
        setupView()
    }
    
    
    private func setupView() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "NewTableViewCell", bundle: nil), forCellReuseIdentifier: "NewTableViewCell")
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        }
        
        // MARK: - Service
        presenter?.loadService()
        
    }
}

extension NewViewController : NewViewProtocol{
    func success(item: [ItemChiste]) {
        listChist = item
    }
    
    func showLoader() {
        CustomLoader.shared.showLoader(in: self.view)
    }
    
    func hideLoader() {
        CustomLoader.shared.hideLoader()
    }
    
    func errorService(message: String) {
        showAlert(message: message)
    }
    
    private func showAlert(title: String = "", message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension NewViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listChist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewTableViewCell", for: indexPath) as? NewTableViewCell else {
            return UITableViewCell()
        }
        let item = listChist[indexPath.row]
        
        
        cell.setupCell(urlImg: item.image, title: item.title)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt - ID: \(listChist[indexPath.row].id) - chiste: \(listChist[indexPath.row].title)")
    }
}

