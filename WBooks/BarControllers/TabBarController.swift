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
        libraryNavigator.tabBarItem = UITabBarItem(title: "LIBRARY".localized(), image: UIImage.libraryImage, selectedImage: UIImage.libraryImage)
        libraryNavigator.tabBarItem.tag = 0
        
        let wishlistNavigator = NavBarController(rootViewController: WishlistController())
        wishlistNavigator.tabBarItem = UITabBarItem(title: "WISHLIST".localized(), image: UIImage.wishlistImage, selectedImage: UIImage.wishlistActiveImage)
        wishlistNavigator.tabBarItem.tag = 1
        
        let addnewNavigator = NavBarController(rootViewController: AddNewController())
        addnewNavigator.tabBarItem = UITabBarItem(title: "ADDNEW".localized(), image: UIImage.addNewImage, selectedImage: UIImage.addNewActiveImage)
        addnewNavigator.tabBarItem.tag = 2
        
        let rentalsNavigator = NavBarController(rootViewController: RentalsController())
        rentalsNavigator.tabBarItem = UITabBarItem(title: "RENTALS".localized(), image: UIImage.rentalsImage, selectedImage: UIImage.rentalsActiveImage)
        rentalsNavigator.tabBarItem.tag = 3
        
        let settingsNavigator = NavBarController(rootViewController: SettingsController())
        settingsNavigator.tabBarItem = UITabBarItem(title: "SETTINGS".localized(), image: UIImage.settingsImage, selectedImage: UIImage.settingsActiveImage)
        settingsNavigator.tabBarItem.tag = 4
        
        viewControllers = [libraryNavigator, wishlistNavigator, addnewNavigator, rentalsNavigator, settingsNavigator]

    }
}
