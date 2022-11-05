//
//  UITextfieldExtension.swift
//  Rides
//
//  Created by Mithun Karun Suma on 2022-11-05.
//

import Foundation
import UIKit


extension UITextField {
    
    ///Gets the text by cleaning  all newlines and spaces
    func getText() -> String? {
        text?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
