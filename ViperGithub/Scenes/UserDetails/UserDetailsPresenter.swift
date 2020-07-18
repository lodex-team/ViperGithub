//
//  UserDetailsPresenter.swift
//  ViperGithub
//
//  Created by Eslam on 7/15/20.
//  Copyright © 2020 ioslam.co. All rights reserved.
//

import Foundation

class UserDetailsPresenter: UserDetailsPresenterProtocol,
UserDetailsInteractorOutputProtocol {
    
    var user: User?
    weak var view: UserDetailsViewProtocol?
    var interactor: UserDetailsInteractorInputProtocol?
    let router: UserDetailsRouterProtocol
    
    init(view: UserDetailsViewProtocol,
         interactor: UserDetailsInteractorInputProtocol,
         router: UserDetailsRouterProtocol, with user: User) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.user = user
    }
    
    func viewDidLoad() {
        print("loaded")
        view?.showTitle(with: user!.login)
    }
    
    func getDataSuccessfully(user: User) {
        
    }
    
    func getDataWithError(errorMsg: GHError) {
        
    }
    
    func getFollowers(by username: String) {
        interactor?.getFollowers(by: username)
    }
    
    
}
