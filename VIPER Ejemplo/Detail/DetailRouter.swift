//
//  DetailRouter.swift
//  VIPER Ejemplo
//
//  Created by Gabriel Castillo Serafim on 15/12/22.
//  
//

import Foundation
import UIKit

class DetailRouter: DetailRouterProtocol {
    
    static func createDetailModule(data: MockData) -> UIViewController {
        
        let view = DetailView()
        let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
        let interactor: DetailInteractorInputProtocol = DetailInteractor()
        let router: DetailRouterProtocol = DetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        presenter.mockData = data
        interactor.presenter = presenter
        
        return view
    }

}
