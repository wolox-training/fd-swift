//
//  NavBarController.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 31/07/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class NavBarController: UINavigationController {
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationBar.isTranslucent = true
        navigationBar.tintColor = .white
        navigationBar.barStyle = .default
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationBar.backgroundColor = .backgroundLightBlue()
        navigationBar.setBackgroundImage(UIImage.navBarBackgroundImage.resizableImage(withCapInsets: .zero, resizingMode: .stretch), for: .default)
        navigationBar.shadowImage = UIImage()
    }
}
