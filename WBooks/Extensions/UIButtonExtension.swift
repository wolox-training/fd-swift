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
            UIColor.blueFirstGradient(),
            UIColor.blueSecondGradient()]
        
        self.gradient = ViewGradient(colors: colors, direction: .leftToRight)
}
    
    func setGreyGradient() {
        let colors = [UIColor.grey(),
                      UIColor.greySecondGradient(),
                      UIColor.greyThirdGradient()]
        
        self.gradient = ViewGradient(colors: colors, direction: .leftToRight)
    }
}
