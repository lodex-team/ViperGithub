//
//  SearchProtocols.swift
//  ViperGithub
//
//  Created by Eslam on 7/14/20.
//  Copyright © 2020 ioslam.co. All rights reserved.
//

import Foundation

protocol SearchViewProtocol: class {
    
    var presenter: SearchPresenterProtocol! { get set }
    
    func showError(errorMsg: String)

}

protocol SearchPresenterProtocol {
    
    var view: SearchViewProtocol? { get set }
    
    func viewDidLoad()
    
    func searchWith(_ username: String)
}

protocol SearchInteractorInputProtocol {
    var presenter: SearchInteractorOutputProtocol? { get set }
    func getUser(with username: String)
}

protocol SearchInteractorOutputProtocol {
    func getDataSuccessfully(user: User)
    func getDataWithError(errorMsg: GHError)
}

protocol SearchRouterProtocol {
    func navigateToUserDetailsView(with user : User)
}
