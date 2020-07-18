//
//  FollowersListPresenter.swift
//  ViperGithub
//
//  Created by Eslam on 7/18/20.
//  Copyright © 2020 ioslam.co. All rights reserved.
//

import Foundation
class FollowersListPresenter: FollowersListPresenterProtocol ,FollowersListInteractorOutputProtocol {
    
    var followersCount: Int?
    weak var view: FollowersListViewProtocol?
    var interactor: FollowersListInteractorInputProtocol
    var router: FollowersListRouter
    var followers = [Follower]()
    init(view: FollowersListViewProtocol,
         interactor: FollowersListInteractorInputProtocol,
         router: FollowersListRouter,
         with followers: [Follower]) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.followers = followers
        self.followersCount = followers.count
    }
    
    func configFollowerCell(cell: FollowersCell, indexPath: IndexPath) {
        let follower = followers[indexPath.row]
        let followerCellView = FollowersCellView(with: follower)
        cell.configure(cellView: followerCellView)
    }
    
    func viewDidLoad() {
        
    }
    
    func getDataSuccessfully() {
        
    }
    
    func failedGettingData() {
        
    }
    
    
}
