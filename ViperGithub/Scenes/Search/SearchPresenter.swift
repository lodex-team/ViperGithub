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
    
    init(view: SearchViewProtocol, interactor: SearchInteractorInputProtocol, router: SearchRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    func viewDidLoad() {
        print("loaded")
    }
    
    func searchWith(_ username: String) {
        Helper.showHideIndicator(isHidden: false, title: "Loading")
        interactor.getUser(with: username)
     }
    
    func getDataSuccessfully(user: User) {
        Helper.showHideIndicator(isHidden: true, title: nil)
        self.user = user
        DispatchQueue.main.async {
            self.router.navigateToUserDetailsView(with: user)
        }
    }
    func getDataWithError(errorMsg: GHError) {
        Helper.showHideIndicator(isHidden: true, title: nil)
        DispatchQueue.main.async {
            self.view?.showError(errorMsg: errorMsg.rawValue)
        }
      }
}
