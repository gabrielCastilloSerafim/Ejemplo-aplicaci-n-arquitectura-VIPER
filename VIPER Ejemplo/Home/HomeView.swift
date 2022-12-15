//
//  HomeView.swift
//  VIPER Ejemplo
//
//  Created by Gabriel Castillo Serafim on 15/12/22.
//  
//

import Foundation
import UIKit
import SkeletonView

class HomeView: UIViewController {

    // MARK: Properties
    var presenter: HomePresenterProtocol?
    private let tableView = UITableView()
    private var mockDataSource = [MockData]()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        presenter?.viewDidLoad()
    }
    
    private func setupView() {
        
        //View
        view.backgroundColor = .white
        title = "Home"
        
        //TableView
        view.addSubview(tableView)
        tableView.rowHeight = 80
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
    
    func showSkeleton() {
        tableView.isSkeletonable = true
        tableView.showAnimatedGradientSkeleton()
    }
    
    func hideSkeleton(receive data: [MockData]) {
        mockDataSource = data
        //He puesto un delay de 3 segundos para que se vea bien el skeleton view funcionando una vez que la respuesta del servidor es casi instantanea
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.tableView.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.8))
        }
    }
}

//MARK: - SkeletonTableViewDataSource

extension HomeView: SkeletonTableViewDataSource {
    
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return CustomTableViewCell.cellIdentifier
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellIdentifier, for: indexPath) as! CustomTableViewCell
        
        cell.myLabel.text = mockDataSource[indexPath.row].title
        
        return cell
    }
}

//MARK: - SkeletonTableViewDelegate

extension HomeView: SkeletonTableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = mockDataSource[indexPath.row]
        
        presenter?.pushNextScreen(from: self, with: data)
    }
}
