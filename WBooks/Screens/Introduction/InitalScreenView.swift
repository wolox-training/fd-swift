//
//  InitialScreenView.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 24/07/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class InitialScreenView: UIView, NibLoadable {
    
    @IBOutlet weak var initialScreenButton: UIButton! {
        didSet {
            initialScreenButton.layer.cornerRadius = Constants.cornerRadiusBig
            initialScreenButton.layer.borderWidth = 1.5
            initialScreenButton.layer.borderColor = UIColor.white.cgColor
        }
    }
    @IBAction func initialScreenButton(_ sender: Any) {
        print("Button has been pressed")
    }
}
