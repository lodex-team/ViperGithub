//
//  MainTabBarController.swift
//  ViperGithub
//
//  Created by Eslam on 7/16/20.
//  Copyright © 2020 ioslam.co. All rights reserved.
//

import UIKit
class MainTabBarController : UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.tabBar.tintColor = #colorLiteral(red: 0, green: 0.2117647059, blue: 0.5294117647, alpha: 1)
        self.tabBar.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.9294117647, blue: 0.9294117647, alpha: 1)
        viewControllers = [
            self.setNavigationControllerNative(rootViewController: SearchRouter.createModule(), withTitle: "Search", withImage: UIImage(named: "baseline_search_black_24pt")!),
            self.setNavigationControllerNative(rootViewController: FavoriteRouter.createModule(), withTitle: "Favorite", withImage: UIImage(named: "baseline_favorite_black_24dp")!)
        ]
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: R.font.poppinsRegular(size: 11)], for: .normal)
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: R.font.poppinsRegular(size: 11)], for: .selected)
    }
//    fileprivate func setNavigationController(rootViewController: UIViewController, withTitle: String, withImage: UIImage) -> UIViewController {
//        let navController = BaseNavigationController(rootViewController: rootViewController)
//        rootViewController.navigationItem.title = withTitle
//        navController.tabBarItem.title = withTitle
//        navController.tabBarItem.image = withImage
//        return navController
//    }
    fileprivate func setNavigationControllerNative(rootViewController: UIViewController, withTitle: String, withImage: UIImage) -> UIViewController {
        let navController = BaseNativeNavigation(rootViewController: rootViewController)
        rootViewController.navigationItem.title = withTitle
        navController.tabBarItem.title = withTitle
        navController.tabBarItem.image = withImage
        return navController
    }
//    @objc private func updateBadgeCount() {
//        // Update badge count
//        self.badgeCount += 1
//        self.tabBar.items?[2].badgeColor = #colorLiteral(red: 0, green: 0.2117647059, blue: 0.5294117647, alpha: 1)
//        self.tabBar.items?[2].badgeValue = ""
//    }
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    }
    
}
