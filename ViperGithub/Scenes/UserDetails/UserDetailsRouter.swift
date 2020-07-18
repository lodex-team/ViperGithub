//
//  UserDetailsRouter.swift
//  ViperGithub
//
//  Created by Eslam on 7/15/20.
//  Copyright © 2020 ioslam.co. All rights reserved.
//

import UIKit

class UserDetailsRouter: UserDetailsRouterProtocol {

    weak var viewController: UIViewController?

    static func createModule(with user: User) -> UIViewController {

        let view = UserDetailsVC()
        let router = UserDetailsRouter()
        let interactor = UserDetailsInteractor()

        let presenter = UserDetailsPresenter(view: view, interactor: interactor, router: router, with: user)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view

    }

}
