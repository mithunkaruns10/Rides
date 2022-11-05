//
//  UIViewExtension.swift
//  Rides
//
//  Created by Mithun Karun Suma on 2022-11-04.
//

import Foundation
import UIKit

extension UIView {
    
    ///Adds border and radius to a view
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
    
    ///Animate a view
    func animate() {
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [.curveEaseInOut, .repeat]) {
            self.transform = CGAffineTransform(translationX: 0,
                                               y: 5)
        } completion: { _ in
            self.transform = .identity
        }
    }
    

}
