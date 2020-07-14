//
//  SearchProtocols.swift
//  ViperGithub
//
//  Created by Eslam on 7/14/20.
//  Copyright © 2020 ioslam.co. All rights reserved.
//

import Foundation

protocol SearchViewProtocol: class {
    var presenter: SearchPresenterProtocol? { get set }
    func showIndicator()
    func hideIndicator()
    func reloadDate()
    func showError(errorMsg: String)

}

protocol SearchPresenterProtocol: class {
    
    var view: SearchViewProtocol? { get set }
    
    func viewDidLoad()
    func searchWith(_ username: String)
}

protocol SearchInteractorInputProtocol: class {
    var presenter: SearchInteractorOutputProtocol? { get set }
}

protocol SearchInteractorOutputProtocol {
    func getDataSuccessfully(user: User)
    func getDataWithError(errorMsg: GHError)
}

protocol SearchRouterProtocol {
    func navigateToUserDetailsView(with user : User)
}
