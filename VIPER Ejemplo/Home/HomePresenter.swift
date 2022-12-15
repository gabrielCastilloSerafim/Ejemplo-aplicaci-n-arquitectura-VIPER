//
//  HomePresenter.swift
//  VIPER Ejemplo
//
//  Created by Gabriel Castillo Serafim on 15/12/22.
//  
//

import Foundation

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var router: HomeRouterProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
    // TODO: implement presenter methods
    
    func viewDidLoad() {
        
        view?.showSkeleton()
        interactor?.getData()
    }
    
    func pushNextScreen(from view: HomeView, with data: MockData) {
        router?.presentDetailedView(from: view, with: data)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // TODO: implement interactor output methods
    
    func presentReceivedData(_ data: [MockData]) {
        view?.hideSkeleton(receive: data)
    }
}
