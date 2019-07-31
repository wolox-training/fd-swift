//
//  RentalsController.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 31/07/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class RentalsController: UIViewController {
    
    private let _view: RentalsView = RentalsView.loadFromNib()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "RENTALS".localized()
    }
    
    override func loadView() {
        view = _view
    }
    
}
