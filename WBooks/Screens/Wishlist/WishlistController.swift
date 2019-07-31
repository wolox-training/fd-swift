//
//  WishlistController.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 31/07/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class WishlistController: UIViewController {
    
    private let _view: WishlistView = WishlistView.loadFromNib()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "WISHLIST".localized()
    }
    
    override func loadView() {
        view = _view
    }
    
}
