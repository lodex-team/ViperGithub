//
//  SearchRouter.swift
//  ViperGithub
//
//  Created by Eslam on 7/14/20.
//  Copyright © 2020 ioslam.co. All rights reserved.
//

import UIKit

class SearchRouter: SearchRouterProtocol {
    func navigateToUserDetailsView(with user: User) {
        
    }
    
   
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        
        let router = SearchRouter()
        let view = SearchVC()
        let interactor = SearchInteractor()
        
        let presenter = SearchPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
        
    }
   
}
