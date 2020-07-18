//
//  UserDetailsProtocol.swift
//  ViperGithub
//
//  Created by Eslam on 7/15/20.
//  Copyright © 2020 ioslam.co. All rights reserved.
//

import Foundation

protocol UserDetailsViewProtocol: class {
    
    var presenter: UserDetailsPresenterProtocol! { get set }
    func showHideIndicator(isHidden: Bool, title: String?)
    func showTitle(with username: String)
    
}


protocol UserDetailsPresenterProtocol {
    
    var view: UserDetailsViewProtocol? { get set }
    func viewDidLoad()
    func getFollowers(by username: String)
    
}

protocol UserDetailsInteractorInputProtocol: class {
    var presenter: UserDetailsInteractorOutputProtocol? { get set }
    func getFollowers(by username: String)
}

protocol UserDetailsInteractorOutputProtocol {
    
    func getDataSuccessfully(user: User)
    func getDataWithError(errorMsg: GHError)
    
}

protocol UserDetailsRouterProtocol {
    
}


