//
//  HomeRemoteDataManager.swift
//  VIPER Ejemplo
//
//  Created by Gabriel Castillo Serafim on 15/12/22.
//  
//

import Foundation

class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {

    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    
    func makeRequest() {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            
            guard let data = data else { print("Error getting data"); return }
            
            let decoder = JSONDecoder()
            
            do {
                let receivedData = try decoder.decode([MockData].self, from: data)
                self?.remoteRequestHandler?.receiveNetworkData(receivedData)
                
            } catch {
                print("Error while decoding json")
                return
            }
        }.resume()
    }
    
}
