//
//  VehicleListTableViewCell.swift
//  Rides
//
//  Created by Mithun Karun Suma on 2022-11-02.
//

import UIKit

class VehicleListTableViewCell: UITableViewCell {
    
    /// Vehicle Item for each cell is set from the ViewController
    var vehicle: Vehicle? {
        didSet {
            configure(vehicle: vehicle)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        uiSetup()
    }
    
    //MARK: - UI Setup
    private func uiSetup() {
        textLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        detailTextLabel?.font = .systemFont(ofSize: 12, weight: .bold)
    }
    
    //MARK: - Configure Cell
    private func configure(vehicle: Vehicle?) {
        textLabel?.text = vehicle?.makeAndModel
        detailTextLabel?.text = vehicle?.vin
        accessoryType = .disclosureIndicator
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
