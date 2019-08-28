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
        let searchButton  = UIButton(type: .custom)
        searchButton.setImage(UIImage(named: "SearchIcon"), for: .normal)
        return UIBarButtonItem(customView: searchButton)
    }
    public static var notificationsButton: UIBarButtonItem {
        let notificationsButton  = UIButton(type: .custom)
        notificationsButton.setImage(UIImage(named: "Notifications"), for: .normal)
        return UIBarButtonItem(customView: notificationsButton)
    }
    
    class func backButton(for viewController: BookDetailFullViewController) -> UIBarButtonItem {
        let backButton  = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "Back"), for: .normal)
        backButton.reactive.controlEvents(.touchUpInside).observeValues { _ in
            viewController.navigationController?.popViewController(animated: true)
        }
        return UIBarButtonItem(customView: backButton)
    }
}
