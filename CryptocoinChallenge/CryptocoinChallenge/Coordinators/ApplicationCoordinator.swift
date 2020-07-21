//
//  MainCoordinator.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 21/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import UIKit

class ApplicationCoordinator: CoordinatorRespectable {
    let window: UIWindow
    var navigationController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        
        navigationController = UINavigationController()
        let rootViewController = TabBarViewController()
        navigationController.isNavigationBarHidden = true
        navigationController.setViewControllers([rootViewController], animated: true)
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
