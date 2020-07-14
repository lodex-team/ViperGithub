//
//  SearchPresenter.swift
//  ViperGithub
//
//  Created by Eslam on 7/14/20.
//  Copyright © 2020 ioslam.co. All rights reserved.
//

import Foundation
class SearchPresenter: SearchPresenterProtocol, SearchInteractorOutputProtocol {
  
    
    
    var interactor: SearchInteractorInputProtocol
    weak var view: SearchViewProtocol?
    let router: SearchRouterProtocol
    var user: User?
    var username: String!
    
    init(view: SearchViewProtocol, interactor: SearchInteractorInputProtocol, router: SearchRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    func viewDidLoad() {
        print("loaded")
    }
    
    func searchWith(_ username: String) {
        self.username = username
    }
    
    func getDataSuccessfully(user: User) {
        self.user = user
    }
    func getDataWithError(errorMsg: GHError) {
        view?.showError(errorMsg: errorMsg.rawValue)
      }
}
