//
//  UIViewControllerExtension.swift
//  Rides
//
//  Created by Mithun Karun Suma on 2022-11-05.
//

import Foundation
import UIKit

extension UIViewController {
    
    ///Show Alert
    func showAlert(title: String,
                   message: String) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: { [weak self] _ in
            self?.dismiss(animated: true)
        }))
        present(alert,
                animated: true)
    }
}
