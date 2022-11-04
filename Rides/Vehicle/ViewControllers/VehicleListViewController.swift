//
//  VehicleListViewController.swift
//  Rides
//
//  Created by Mithun Karun Suma on 2022-11-02.
//

import UIKit

class VehicleListViewController: UIViewController {
    
    //MARK: - UI Elements
    let inputTextField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.placeholder = "Enter number of vehicles"
        return txtField
    }()
    
    let searchButton: UIButton = {
        let btn = UIButton()
        btn.tintColor = .white
        btn.backgroundColor = .systemBlue
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "magnifyingglass"),
                     for: .normal)
        return btn
    }()
    
    let sortOptionsButton: UIButton = {
        let btn = UIButton()
        btn.tintColor = .white
        btn.backgroundColor = .systemBlue
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14,
                                                 weight: .medium)
        btn.setImage(UIImage(systemName: "line.3.horizontal.decrease.circle"),
                     for: .normal)
        return btn
    }()
    
    let tableView: UITableView = {
        let tv = UITableView(frame: .zero,
                             style: .grouped)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorColor = .systemBlue
        tv.separatorInset = .zero
        return tv
    }()
    
    var sortOption: SortOption = .vin
    
    //MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiSetup()
        layoutUIElements()
        tableViewSetup()
        sortMenuSetup()
    }
    
    //MARK: - Setup UI
    private func uiSetup() {
        
        title = Constant.findVehicles
        view.backgroundColor = .systemBackground
        [inputTextField,
         sortOptionsButton,
         searchButton].forEach({
            $0.addBorder(borderColor: .lightGray,
                         cornerRadius: 8.0)
        })
        
        searchButton.addTarget(self,
                      action: #selector(handleSearchAction),
                      for: .touchUpInside)
        sortOptionsButton.addTarget(self,
                      action: #selector(handleSearchAction),
                      for: .touchUpInside)
    }
    
    //MARK: - Setup Sort Menu
    private func sortMenuSetup() {
        let carType = UIAction(title: Constant.carType, state: .off) { [weak self] _ in
            
        }
        let vin = UIAction(title: Constant.VIN, state: .on) { [weak self] _ in
            
        }
        
        sortOptionsButton.showsMenuAsPrimaryAction = true
        sortOptionsButton.menu = UIMenu(title: Constant.sortBy,
                                        identifier: .text,
                                        options: [.displayInline],
                                        children: [vin,
                                                  carType])
    }
    
    //MARK: - UITableView Setup
    private func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        
        tableView.register(VehicleListTableViewCell.self,
                           forCellReuseIdentifier: Constant.Identifier.vehicleListCellId)
    }
    
    //MARK: - Apply Constraints to all UI elements
    private func layoutUIElements() {
        
        let topStackView = UIStackView(arrangedSubviews: [
            inputTextField,
            searchButton,
            sortOptionsButton
        ])
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.axis = .horizontal
        topStackView.distribution = .fillProportionally
        topStackView.spacing = 8
        
        [topStackView,
         tableView
        ].forEach({ view.addSubview($0)})
        
        NSLayoutConstraint.activate([
            topStackView.leadingAnchor.constraint(
                equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor,
                multiplier: 1.0),
            topStackView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -10),
            topStackView.topAnchor.constraint(
                equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor,
                multiplier: 1.0),
            topStackView.bottomAnchor.constraint(
                lessThanOrEqualToSystemSpacingBelow: tableView.topAnchor,
                multiplier: 1.0),
            
            tableView.topAnchor.constraint(
                equalToSystemSpacingBelow: topStackView.bottomAnchor,
                multiplier: 1.0),
            tableView.bottomAnchor.constraint(
                equalToSystemSpacingBelow: view.safeAreaLayoutGuide.bottomAnchor,
                multiplier: 1.0),
            tableView.leadingAnchor.constraint(
                equalToSystemSpacingAfter: view.leadingAnchor,
                multiplier: 1.0),
            tableView.trailingAnchor.constraint(
                equalToSystemSpacingAfter: view.trailingAnchor,
                multiplier: 1.0),
            
            inputTextField.heightAnchor.constraint(equalToConstant: 40),
            
            searchButton.widthAnchor.constraint(equalToConstant: 40),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            
            sortOptionsButton.widthAnchor.constraint(equalToConstant: 40),
            sortOptionsButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    //MARK: - Handle Search Action
    @objc private func handleSearchAction() {
        
    }
    
    //MARK: - Handle Sort Action
    @objc private func handleSortAction() {
        
    }
    
    
}

//MARK: - UITableView delegate and dataSource Methods
extension VehicleListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Identifier.vehicleListCellId,
                                                       for: indexPath) as? VehicleListTableViewCell else {
            return UITableViewCell()
        }
        
        cell.vehicle = Vehicle(id: 1, uid: "ww", vin: "qaxasxasx", makeAndModel: "Audi Q3", color: "blue", transmission: "ddd", driveType: "dd", fuelType: "", carType: "", carOptions: [""], specs: [], doors: 2, mileage: 2, kilometrage: 2, licensePlate: "JDHSJSKJ")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(format: Constant.vehicles, sortOption.rawValue)
    }
}
