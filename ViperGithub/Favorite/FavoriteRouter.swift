//
//  FavoriteRouter.swift
//  ViperGithub
//
//  Created by Eslam on 7/17/20.
//  Copyright © 2020 ioslam.co. All rights reserved.
//

import UIKit

class FavoriteRouter: FavoriteRouterProtocol {
    
    var presenter: FavoriteInteractorOutputProtocol?
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        
        let view = FavoriteVC()
        let interactor = FavoriteInteractor()
        let router = FavoriteRouter()
        let presenter = FavoritePresenter(view: view, router: router, interactor: interactor)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }

    func navigateToFollowerListVC(with followers: [Follower]) {
        let followerListVC = FollowersListRouter.createModule(with: followers)
        DispatchQueue.main.async {
            self.viewController?.navigationController?.pushViewController(followerListVC, animated: true)
        }
       }
    
}
