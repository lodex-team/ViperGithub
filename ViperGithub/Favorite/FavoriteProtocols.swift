//
//  FavoriteProtocols.swift
//  ViperGithub
//
//  Created by Eslam on 7/17/20.
//  Copyright © 2020 ioslam.co. All rights reserved.
//

import Foundation

protocol FavoriteViewProtocol: class {
    var presenter: FavoritePresenterProtocol! { get set }
    func showHideSpinner(isHidden: Bool, title: String?)
    func showErrorAlert(with errorMessage: GHError)
}

protocol FavoritePresenterProtocol {
    var view: FavoriteViewProtocol? { get set }
    func viewDidLoad()
    func searchFollowers(by username: String)
}

protocol FavoriteInteractorInputProtocol {
    var presenter: FavoriteInteractorOutputProtocol? { get set }
    func getFollowers(by username: String)
}

protocol FavoriteInteractorOutputProtocol {
    func getFollowersSuccessfully(with followers: [Follower])
    func failsGettingFollowers(with errorMessage: GHError)
}

protocol FavoriteRouterProtocol {
    func navigateToFollowerListVC(with followers: [Follower])
}
