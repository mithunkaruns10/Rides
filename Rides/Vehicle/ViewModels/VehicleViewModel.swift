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
    
    //MARK: - Input value validation
    func validate(input: Int?) -> Bool {
        guard let input = input else {
            return false
        }
        ///Check and return valid or not
        let minInputVal = 1
        let maxInputVal = 100
        let validRange = minInputVal...maxInputVal
        return validRange.contains(input)
    }
    
    //MARK: - Calculate Carbon Emission
    func calculateEstimatedCarbonEmission(kilometrage: Int) -> String {
        
        ///First 5000km emits 1 unit/km
        let thresholdValue = 5000
        if kilometrage <= thresholdValue {
            return String(kilometrage)
        } else {
            ///Extra emission for each kilometer after the threshold value 5000
            let extraKilometer = Double(kilometrage - thresholdValue)
            return String(thresholdValue + Int(extraKilometer * 1.5))
        }
    }
}
