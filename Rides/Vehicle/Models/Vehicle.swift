//
//  Vehicle.swift
//  Rides
//
//  Created by Mithun Karun Suma on 2022-11-02.
//

import Foundation

//MARK: - Vehicle model

struct Vehicle: Codable {
    let id: Int
    let uid, vin, makeAndModel, color: String?
    let transmission, driveType, fuelType, carType: String?
    let carOptions, specs: [String]?
    let doors, mileage, kilometrage: Int?
    let licensePlate: String?
    
    enum CodingKeys: String, CodingKey {
        case id, uid, vin
        case makeAndModel = "make_and_model"
        case color, transmission
        case driveType = "drive_type"
        case fuelType = "fuel_type"
        case carType = "car_type"
        case carOptions = "car_options"
        case specs, doors, mileage, kilometrage
        case licensePlate = "license_plate"
    }
}

//MARK: - Enum for Sort options

enum SortOption: String {
    case vin = "VIN"
    case carType = "Car Type"
}
