//
//  HomeRouter.swift
//  VIPER Ejemplo
//
//  Created by Gabriel Castillo Serafim on 15/12/22.
//  
//

import Foundation
import UIKit

class HomeRouter: HomeRouterProtocol {
    
    static func createHomeModule() -> UIViewController {
        
        //Instantiate HomeView
        let view = HomeView()
        
        //Create navController and set its first ViewController
        let navController = UINavigationController()
        navController.navigationBar.prefersLargeTitles = true
        navController.viewControllers = [view]
        
        //Initialise all VIPER classes
        let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
        let interactor: HomeInteractorInputProtocol & HomeRemoteDataManagerOutputProtocol = HomeInteractor()
        let remoteDataManager: HomeRemoteDataManagerInputProtocol = HomeRemoteDataManager()
        let router: HomeRouterProtocol = HomeRouter()
        
        //Inject the proper properties to every class to allow communication between them.
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        
        return navController
    }
    
    func presentDetailedView(from view: HomeView, with data: MockData) {
        
        let nextVC = DetailRouter.createDetailModule(data: data)
        
        view.navigationController?.pushViewController(nextVC, animated: true)
    }
}


