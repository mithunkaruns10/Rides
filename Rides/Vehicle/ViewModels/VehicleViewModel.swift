//
//  VehicleViewModel.swift
//  Rides
//
//  Created by Mithun Karun Suma on 2022-11-02.
//

import Foundation

//MARK: - Vehicle ViewModel

struct VehicleViewModel {
    
    var networkManager: NetworkManager
    
    //MARK: - Init
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    //MARK: - API - Get Vehicles
    func getVehicles(_ endPoint: String,
                     completion: @escaping ((_ vehicles: [Vehicle]?,
                                             _ error: NetworkError?) -> Void)) {
        
        networkManager.makeNetworkCall(endPoint) { (result: Result<[Vehicle], NetworkError>)  in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    let vehicles = success
                    completion(vehicles, nil)
                case .failure(let failure):
                    completion(nil, failure)
                }
            }
        }
    }
}
