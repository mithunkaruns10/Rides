//
//  File.swift
//  Rides
//
//  Created by Mithun Karun Suma on 2022-11-04.
//

import Foundation

//MARK: - Endpoints
struct URLEndPoint {
    
    ///Base URL
    static let baseUrl = "https://random-data-api.com/api/"
    
    ///Get vehicles
    static let vehicles = "vehicle/random_vehicle?size=%d"
}

//MARK: - Network Error

enum NetworkError: Error {
    case invalidURL(message: String)
    case apiError(message: String)
    case parseError(message: String)
    case unknown(message: String)
}
