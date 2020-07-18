//
//  FollowersListRouter.swift
//  ViperGithub
//
//  Created by Eslam on 7/18/20.
//  Copyright © 2020 ioslam.co. All rights reserved.
//

import UIKit

class FollowersListRouter: FollowersListRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(with followers: [Follower])-> UIViewController {
        let view = FollowerListVC()
        let interactor = FollowersListInteractor()
        let router = FollowersListRouter()
        let presenter = FollowersListPresenter(view: view, interactor: interactor, router: router, with: followers)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
    
        return view
    }

}
