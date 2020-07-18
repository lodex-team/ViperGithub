//
//  BaseNavigationController.swift
//  ViperGithub
//
//  Created by Eslam on 7/16/20.
//  Copyright © 2020 ioslam.co. All rights reserved.
//

import UIKit

class BaseNativeNavigation: UINavigationController {
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
