//
//  HomeInteractor.swift
//  VIPER Ejemplo
//
//  Created by Gabriel Castillo Serafim on 15/12/22.
//  
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?

    
    func getData() {
        remoteDatamanager?.makeRequest()
    }
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    
    // TODO: Implement use case methods
    
    func receiveNetworkData(_ data: [MockData]) {
        
        let filteredData = data.filter { $0.id < 15 }
        
        presenter?.presentReceivedData(filteredData)
    }
}
