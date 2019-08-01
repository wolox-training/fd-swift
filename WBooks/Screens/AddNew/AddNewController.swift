//
//  AddNewController.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 31/07/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class AddNewController: UIViewController {
    
    private let _view: AddNewView = AddNewView.loadFromNib()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ADDNEW".localized()
    }
    
    override func loadView() {
        view = _view
    }
    
}
