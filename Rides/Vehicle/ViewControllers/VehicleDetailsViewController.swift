//
//  VehicleDetailsViewController.swift
//  Rides
//
//  Created by Mithun Karun Suma on 2022-11-02.
//

import UIKit

class VehicleDetailsViewController: UICollectionViewController {
    
    //MARK: - Variables
    var vehicle: Vehicle?
    var numberOfSections = 1
    var numberOfRows = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiSetup()
        collectionViewSetup()
    }
    
    //MARK: - Init
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    //MARK: - Setup UI
    private func uiSetup() {
        title = vehicle?.makeAndModel
        navigationController?.navigationBar.prefersLargeTitles = true
        edgesForExtendedLayout = .bottom
    }
    
    //MARK: - UICollectionView Setup
    private func collectionViewSetup() {
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(VehicleDetailsCell.self,
                                forCellWithReuseIdentifier: Constant.Identifier.vehicleDetailsCellId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UICollectionView delegate & dataSource Methods
extension VehicleDetailsViewController: UICollectionViewDelegateFlowLayout {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfSections
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.Identifier.vehicleDetailsCellId,
                                                           for: indexPath) as? VehicleDetailsCell else {
           return UICollectionViewCell()
       }
        cell.vehicle = vehicle
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = view.frame.height 
        return CGSize(width: width,
                      height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
