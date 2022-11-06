//
//  RidesTests.swift
//  RidesTests
//
//  Created by Mithun Karun Suma on 2022-11-02.
//

import XCTest
@testable import Rides

class RidesTests: XCTestCase {

    var vehicleViewModel: VehicleViewModel!
    override func setUpWithError() throws {
        vehicleViewModel = VehicleViewModel(networkManager: NetworkManager.sharedManager)
    }

    override func tearDownWithError() throws {
        vehicleViewModel = nil
    }
    
    //MARK: - Test for Inputfield validation
    func testValidateInputTextFieldValue() throws {
        
        ///Suceess input cases
        let validMinValue = 1
        let validMaxValue = 100
        let validRandomValue = 26
        
        let testOne = vehicleViewModel.validate(input: validMinValue)
        let testTwo = vehicleViewModel.validate(input: validMaxValue)
        let testThree = vehicleViewModel.validate(input: validRandomValue)
        
        XCTAssertTrue(testOne)
        XCTAssertTrue(testTwo)
        XCTAssertTrue(testThree)
        
        ///Failure input cases
        let valueBelowMinValue = 0
        let valueAboveMaxValue = 150
        
        let testFour = vehicleViewModel.validate(input: valueBelowMinValue)
        let testFive = vehicleViewModel.validate(input: valueAboveMaxValue)
        let testSix = vehicleViewModel.validate(input: nil)
        
        XCTAssertFalse(testFour)
        XCTAssertFalse(testFive)
        XCTAssertFalse(testSix)
    }
    
    //MARK: - Test for Emission calculation
    func testCalculateEstimatedCarbonEmission() throws {
        
        ///Expected emission calculation for kilometrage till 5000
        let expectedEmissionTillThreshold = String(5000)
        
        ///Expected emission calculation for kilometrage beyond 5000
        let expectedEmissionBeyondThreshold = String(5000 + Int(1000 * 1.5))
        
        ///Calculations
        let emissionTillThreshold = vehicleViewModel.calculateEstimatedCarbonEmission(kilometrage: 5000)
        let emissionBeyondThreshold = vehicleViewModel.calculateEstimatedCarbonEmission(kilometrage: 6000)
        
        XCTAssertEqual(emissionTillThreshold,
                       expectedEmissionTillThreshold)
        XCTAssertEqual(expectedEmissionBeyondThreshold,
                       emissionBeyondThreshold)

    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
