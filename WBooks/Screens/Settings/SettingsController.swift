//
//  SettingsController.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 31/07/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class SettingsController: UIViewController {
    
    private let _view: SettingsView = SettingsView.loadFromNib()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SETTINGS".localized()
    }
    
    override func loadView() {
        view = _view
    }
    
}
