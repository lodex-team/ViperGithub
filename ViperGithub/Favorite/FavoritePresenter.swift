//
//  FavoritePresenter.swift
//  ViperGithub
//
//  Created by Eslam on 7/17/20.
//  Copyright © 2020 ioslam.co. All rights reserved.
//

import Foundation

class FavoritePresenter: FavoritePresenterProtocol, FavoriteInteractorOutputProtocol {
    
    var followers = [Follower]()
    weak var view: FavoriteViewProtocol?
    var interactor: FavoriteInteractorInputProtocol
    var router: FavoriteRouterProtocol
    
    init(view: FavoriteViewProtocol, router: FavoriteRouterProtocol, interactor: FavoriteInteractorInputProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
    }
    
    func searchFollowers(by username: String) {
        interactor.getFollowers(by: username)
    }
    
    func getFollowersSuccessfully(with followers: [Follower]) {
        self.followers.append(contentsOf: followers)
        DispatchQueue.main.async {
            self.router.navigateToFollowerListVC(with: followers)
        }
    }
    
    func failsGettingFollowers(with errorMessage: GHError) {
        DispatchQueue.main.async {
            self.view?.showErrorAlert(with: errorMessage)
        }
    }
    
}
