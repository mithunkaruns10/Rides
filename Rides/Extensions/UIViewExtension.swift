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
    
    ///Render color from color name
    func color(name: Color) {
        var selectedColor: UIColor = .systemBlue
        switch name {
        case .white:
            selectedColor = .white
        case .black:
            selectedColor = .black
        case .grey:
            selectedColor = .gray
        case .violet:
            selectedColor = .systemCyan
        case .indigo:
            selectedColor = .purple
        case .blue:
            selectedColor = .systemBlue
        case .green:
            selectedColor = .systemGreen
        case .yellow:
            selectedColor = .systemYellow
        case .orange:
            selectedColor = .systemOrange
        case .red:
            selectedColor = .systemRed
        case .beige:
            selectedColor = .systemMint
        }
        
        backgroundColor = selectedColor
    }
}
