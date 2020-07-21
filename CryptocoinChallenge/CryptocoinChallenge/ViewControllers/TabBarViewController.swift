//
//  TabViewController.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 21/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewControllers()
    }
    
    // MARK: - Setup
    private func setupUI() {

        // Set TabBar Appearance
        tabBar.barTintColor = .white
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray
        tabBar.isTranslucent = false
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        
        // Add TabBar shadow
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 16
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.10
    }
    
    private func setupViewControllers() {
        var viewControllers = [UIViewController]()
        
        let assetsController = AssetsController()
        assetsController.tabBarItem =  .init(title: "Assets", image: .init(), selectedImage: nil)
        let assetsNavigationController = UINavigationController(rootViewController: assetsController)
        viewControllers.append(assetsNavigationController)
        
        let walletsController = WalletsController()
        walletsController.tabBarItem = .init(title: "Wallets", image: .init(), selectedImage: nil)
        let walletsNavigationController = UINavigationController(rootViewController: walletsController)
        viewControllers.append(walletsNavigationController)
        
        setViewControllers(viewControllers, animated: true)
    }
}
