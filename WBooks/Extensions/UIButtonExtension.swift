//
//  UIButtonExtension.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 12/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

extension UIButton {
    
    @IBInspectable var borderLineRadius: CGFloat {
        set {
            layer.cornerRadius = borderLineRadius
        }
        get {
            return layer.cornerRadius
        }
    }
    
    func setBlueGradient() {
        let colors = [
            UIColor(red: 0.0, green: 0.68, blue: 0.93, alpha: 1),
            UIColor(red: 0.22, green: 0.8, blue: 0.8, alpha: 1)]
        
        self.gradient = ViewGradient(colors: colors, direction: .leftToRight)
}
    
    func setGreyGradient() {
        let colors = [UIColor(red: 0.79, green: 0.79, blue: 0.79, alpha: 1),
                      UIColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1),
                      UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)]
        
        self.gradient = ViewGradient(colors: colors, direction: .leftToRight)
    }
}
