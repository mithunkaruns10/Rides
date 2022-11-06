//
//  VehicleDetailsCell.swift
//  Rides
//
//  Created by Mithun Karun Suma on 2022-11-04.
//

import Foundation
import UIKit


class VehicleDetailsCell: UICollectionViewCell {
    
    //MARK: - UI Elements
    let containerView: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let vehicleImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(named: "demo")
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    let vinLabel: UILabel = {
      let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .systemGray
        lbl.text = "--"
        lbl.font = UIFont.systemFont(ofSize: 15,
                                     weight: .bold)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let vehicleMakeAndModelLabel: UILabel = {
      let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .label
        lbl.text = "--"
        lbl.font = UIFont.systemFont(ofSize: 20,
                                     weight: .semibold)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let colorLabel: UILabel = {
      let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .label
        lbl.text = "--"
        lbl.font = UIFont.systemFont(ofSize: 17,
                                     weight: .medium)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let colorButton:  UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemBlue
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let dragButton:  UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemBlue
        btn.setImage(UIImage(systemName: "chevron.right"),
                     for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .white
        return btn
    }()
    
    //MARK: - Variables
    var vehicle: Vehicle? {
        didSet {
            configure(vehicle: vehicle)
        }
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutViews()
        uiSetup()
    }
    
    //MARK: - UI Setup
    private func uiSetup() {
        colorButton.addBorder(cornerRadius: 10)
        dragButton.addBorder(borderWidth: 0.0,
                             cornerRadius: 20)
        containerView.addBorder(borderWidth: 0.0,
                                cornerRadius: 12)
        containerView.backgroundColor = .opaqueSeparator.withAlphaComponent(0.5)
        
        dragButton.animate()
    }
    
    //MARK: - Layout
    private func layoutViews() {
        ///Add all UI elements to the main view
        let stackView = UIStackView(arrangedSubviews: [
            vehicleImageView,
            containerView
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        [stackView,
         dragButton
        ].forEach({
            contentView.addSubview($0)
        })
        
        [vehicleMakeAndModelLabel,
         vinLabel,
         colorLabel,
         colorButton
        ].forEach({
            containerView.addSubview($0)
        })
        
        ///Apply constraints to all
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.widthAnchor.constraint(
                equalTo: contentView.widthAnchor,
                multiplier: 0.75),
            stackView.heightAnchor.constraint(
                equalTo: contentView.heightAnchor,
                multiplier: 0.75),
            
            containerView.widthAnchor.constraint(
                equalTo: stackView.widthAnchor,
                multiplier: 1.0),
            
            vehicleImageView.widthAnchor.constraint(equalToConstant: 125),
            vehicleImageView.heightAnchor.constraint(equalToConstant: 125),
            
            vehicleMakeAndModelLabel.leadingAnchor.constraint(
                equalToSystemSpacingAfter: containerView.leadingAnchor,
                multiplier: 2.0),
            vehicleMakeAndModelLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor, constant: -16),
            vehicleMakeAndModelLabel.topAnchor.constraint(
                equalToSystemSpacingBelow: containerView.topAnchor,
                multiplier: 1.0),
            vehicleMakeAndModelLabel.bottomAnchor.constraint(
                equalTo: colorButton.topAnchor,
                constant: -16),
            
            colorButton.widthAnchor.constraint(equalToConstant: 20),
            colorButton.heightAnchor.constraint(equalToConstant: 20),
            colorButton.leadingAnchor.constraint(
                equalToSystemSpacingAfter: containerView.leadingAnchor,
                multiplier: 2.0),
            colorButton.trailingAnchor.constraint(
                equalTo: colorLabel.leadingAnchor,
                constant: -8),
            colorButton.topAnchor.constraint(
                equalToSystemSpacingBelow: vehicleMakeAndModelLabel.bottomAnchor,
                multiplier: 1.0),
            
            colorLabel.leadingAnchor.constraint(
                equalToSystemSpacingAfter: colorButton.trailingAnchor,
                multiplier: 1.0),
            colorLabel.trailingAnchor.constraint(
                equalToSystemSpacingAfter: vehicleMakeAndModelLabel.trailingAnchor,
                multiplier: 0.5),
            colorLabel.centerYAnchor.constraint(equalTo: colorButton.centerYAnchor),
            
            vinLabel.leadingAnchor.constraint(
                equalToSystemSpacingAfter: vehicleMakeAndModelLabel.leadingAnchor,
                multiplier: 1.0),
            vinLabel.trailingAnchor.constraint(
                equalToSystemSpacingAfter: vehicleMakeAndModelLabel.trailingAnchor,
                multiplier: 0.5),
            vinLabel.topAnchor.constraint(equalTo: colorButton.bottomAnchor,
                                          constant: 16),
            
            dragButton.widthAnchor.constraint(equalToConstant: 40),
            dragButton.heightAnchor.constraint(equalToConstant: 40),
            dragButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,
                                               constant: 16),
            dragButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
            
        ])
    }
    
    //MARK: - Configure Cell
    private func configure(vehicle: Vehicle?) {
        colorLabel.text = vehicle?.color
        vehicleMakeAndModelLabel.text = vehicle?.carType
        vinLabel.text = "VIN: " + (vehicle?.vin ?? "--")
        let vehicleColor =  Color(rawValue: vehicle?.color ?? "default") ?? .grey
        colorButton.color(name: vehicleColor)
    }
    
    //MARK: - Configure EmissionCell
    func configureEmissionCell(emisson: String?) {
        colorLabel.text = Constant.estimatedCarbonEmission
        vehicleMakeAndModelLabel.text = Constant.emissionDetails
        vinLabel.text = (emisson ?? "--") + " Unit"
        colorButton.isHidden = true
        dragButton.isHidden = true
        [colorLabel,
         vehicleMakeAndModelLabel,
         vinLabel
        ].forEach({ $0.textAlignment = .center})
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
