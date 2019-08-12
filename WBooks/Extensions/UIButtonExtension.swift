//
//  UIButtonExtension.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 12/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit

extension UIButton {
    @IBInspectable var borderLineWidth: CGFloat {
        set {
            layer.borderWidth = borderLineWidth
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var borderLineRadius: CGFloat {
        set {
            layer.cornerRadius = borderLineRadius
        }
        get {
            return layer.cornerRadius
        }
    }
    
    func setBlueGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        gradient.colors = [
            UIColor(red: 0.0, green: 0.68, blue: 0.93, alpha: 1).cgColor,
            UIColor(red: 0.22, green: 0.8, blue: 0.8, alpha: 1).cgColor]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.cornerRadius = borderLineRadius
        borderLineWidth = 0.0
        layer.addSublayer(gradient)
        }
    
    func setGreyGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        gradient.colors = [
            UIColor(red: 0.79, green: 0.79, blue: 0.79, alpha: 1).cgColor,
            UIColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1).cgColor,
            UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1).cgColor]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.cornerRadius = borderLineRadius
        borderLineWidth = 0.0
        layer.addSublayer(gradient)
    }
}
