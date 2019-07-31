//
//  TabBarController.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 31/07/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = .backgroundLightBlue()
        
        let libraryNavigator = NavBarController(rootViewController: BookLibraryController())
        libraryNavigator.tabBarItem = UITabBarItem()
        libraryNavigator.tabBarItem.title = "LIBRARY".localized()
        libraryNavigator.tabBarItem.image = UIImage(named: "Library")!
        libraryNavigator.tabBarItem.selectedImage = UIImage(named: "LibraryActive")!
        libraryNavigator.tabBarItem.tag = 0
        
        let wishlistNavigator = NavBarController(rootViewController: WishlistController())
        wishlistNavigator.tabBarItem = UITabBarItem()
        wishlistNavigator.tabBarItem.title = "WISHLIST".localized()
        wishlistNavigator.tabBarItem.image = UIImage(named: "Wishlist")!
        wishlistNavigator.tabBarItem.image = UIImage(named: "WishlistActive")!
        wishlistNavigator.tabBarItem.tag = 1
        
        let addnewNavigator = NavBarController(rootViewController: AddNewController())
        addnewNavigator.tabBarItem = UITabBarItem()
        addnewNavigator.tabBarItem.title = "ADDNEW".localized()
        addnewNavigator.tabBarItem.image = UIImage(named: "AddNew")!
        addnewNavigator.tabBarItem.image = UIImage(named: "AddNewActive")!
        addnewNavigator.tabBarItem.tag = 2
        
        let rentalsNavigator = NavBarController(rootViewController: RentalsController())
        rentalsNavigator.tabBarItem = UITabBarItem()
        rentalsNavigator.tabBarItem.title = "RENTALS".localized()
        rentalsNavigator.tabBarItem.image = UIImage(named: "Rentals")!
        rentalsNavigator.tabBarItem.image = UIImage(named: "RentalsActive")!
        rentalsNavigator.tabBarItem.tag = 3
        
        let settingsNavigator = NavBarController(rootViewController: SettingsController())
        settingsNavigator.tabBarItem = UITabBarItem()
        settingsNavigator.tabBarItem.title = "SETTINGS".localized()
        settingsNavigator.tabBarItem.image = UIImage(named: "Settings")!
        settingsNavigator.tabBarItem.image = UIImage(named: "SettingsActive")!
        settingsNavigator.tabBarItem.tag = 4
        
        viewControllers = [libraryNavigator, wishlistNavigator, addnewNavigator, rentalsNavigator, settingsNavigator]

    }
}
