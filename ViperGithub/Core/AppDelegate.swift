//
//  AppDelegate.swift
//  ViperGithub
//
//  Created by Eslam on 7/14/20.
//  Copyright © 2020 ioslam.co. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        window.rootViewController = createTabBar()
        window.makeKeyAndVisible()

        return true
    }
    func createTabBar() -> MainTabBarController {
        let tabBarVC = MainTabBarController()
        UITabBar.appearance().tintColor = .systemGreen
        return tabBarVC
    }

    func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        searchVC.title = "Search"
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createFavoriteNC() -> UINavigationController {
        let favoriteVC = FavoriteVC()
        favoriteVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        favoriteVC.title = "Favorite"
    return UINavigationController(rootViewController: favoriteVC)
    }
    
//    func configureNavigationBar() {
//        UINavigationBar.appearance().tintColor = .systemGreen
//    }
}

