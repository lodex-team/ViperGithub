//
//  FavoriteInteractor.swift
//  ViperGithub
//
//  Created by Eslam on 7/17/20.
//  Copyright © 2020 ioslam.co. All rights reserved.
//

import Foundation

class FavoriteInteractor: FavoriteInteractorInputProtocol {
    var presenter: FavoriteInteractorOutputProtocol?
    
    func getFollowers(by username: String) {
        NetworkManager.shared.getFollowersList(username: username, page: 1) {[weak self] result  in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                self.presenter?.failsGettingFollowers(with: error)
            case .success(let followers):
                self.presenter?.getFollowersSuccessfully(with: followers)
            }
        }
    }
    
    
}
