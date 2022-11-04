//
//  UIViewExtension.swift
//  Rides
//
//  Created by Mithun Karun Suma on 2022-11-04.
//

import Foundation
import UIKit

extension UIView {
    
    ///Adds border anf radius to anu view
    func addBorder(borderWidth: CGFloat = 1.0,
                   borderColor: UIColor = .black,
                   cornerRadius: CGFloat? = nil) {
        
        if let cornerRadius = cornerRadius {
            layer.cornerRadius = cornerRadius
        }
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        layer.masksToBounds = true
    }
}
