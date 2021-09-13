//
//  AppDelegate.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var coordinator: MainCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else { return false }
        coordinator = AppCoordinator(window: window)
        coordinator?.start()
        
        return true
    }
    
}
