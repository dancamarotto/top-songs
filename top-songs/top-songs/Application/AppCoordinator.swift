//
//  AppCoordinator.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import UIKit

/// Since we use no storyboards in this application, the entry point is defined here.
class AppCoordinator: MainCoordinator {
    var window: UIWindow
    var childCoordinator = [Coordinator]()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        let coordinator = TopAlbumsCoordinator(navigationController: navigationController)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        childCoordinator.append(coordinator)
        coordinator.start()
    }
}
