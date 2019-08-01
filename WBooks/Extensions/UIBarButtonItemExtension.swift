//
//  UIBarButtonItem.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 01/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    
    public static var searchButton: UIBarButtonItem {
        return UIBarButtonItem(image: UIImage(named: "SearchIcon"), style: UIBarButtonItem.Style.plain, target: self, action: nil)
    }
    public static var notificationsButton: UIBarButtonItem {
        return UIBarButtonItem(image: UIImage(named: "Notifications"), style: UIBarButtonItem.Style.plain, target: self, action: nil)
    }
    
}
