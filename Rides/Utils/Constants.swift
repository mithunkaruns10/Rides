//
//  Constants.swift
//  Rides
//
//  Created by Mithun Karun Suma on 2022-11-02.
//

import Foundation

//MARK: - All App constants
struct Constant {
    
    ///Other constants
    static let findVehicles = "Find Vehicles"
    static let vehicles = "Vehicles (Sorted by %@)"
    static let carType = "Car Type"
    static let VIN = "VIN"
    static let sortBy = "Sort By"
    
    /// Identifiers
    struct Identifier {
        
        //Cell Identifiers
        static let vehicleListCellId = "VehicleListTableViewCell"
        static let emissionDetailsCellId = "EmissionDetailsCollectionViewCell"
        static let vehicleDetailsCellId = "VehicleDetailsCell"
    }
    
    ///Error Messages
    static let InvalidUrl = "Invalid URL"
    static let unknownError = "Unknown error"
    
}

//MARK: - Color Enum
enum Color: String {
    case white = "White"
    case black = "Black"
    case grey = "Grey"
    case violet = "Violet"
    case indigo = "Indigo"
    case blue = "Blue"
    case green = "Green"
    case yellow = "Yellow"
    case orange = "Orange"
    case red = "Red"
    case beige = "Beige"
}
