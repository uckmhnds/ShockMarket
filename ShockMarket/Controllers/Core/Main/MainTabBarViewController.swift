//
//  MainTabBarController.swift
//  ShockMarket
//
//  Created by Abdurrahman Gazi Yavuz on 29.09.2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor    = .systemYellow
        
        let productsVC          = UINavigationController(rootViewController: ProductsTabViewController())
        let searchVC            = UINavigationController(rootViewController: SearchTabViewController())
        let cartVC              = UINavigationController(rootViewController: CartTabViewController())
        let profileVC           = UINavigationController(rootViewController: ProfileTabViewController())
        
        productsVC.title        = "Products"
        searchVC.title          = "Search"
        cartVC.title            = "Your cart"
        profileVC.title         = "Profile"
        
        tabBar.tintColor                = .label
        
        setViewControllers([productsVC, searchVC, cartVC, profileVC], animated: true)

    }
    


}
