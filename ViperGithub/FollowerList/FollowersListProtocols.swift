//
//  FollowersListProtocols.swift
//  ViperGithub
//
//  Created by Eslam on 7/18/20.
//  Copyright © 2020 ioslam.co. All rights reserved.
//

import Foundation
protocol FollowersListViewProtocol: class {
    var presenter: FollowersListPresenterProtocol? { get set }
    func reloadData()
    func errorFetchingData(with errMessage: GHError)
}

protocol FollowersListPresenterProtocol: class {
    var view: FollowersListViewProtocol? { get set }
    var followersCount: Int? { get }
    func viewDidLoad()
    func configFollowerCell(cell: FollowersCell, indexPath: IndexPath)
}

protocol FollowersListInteractorInputProtocol: class {
    var presenter: FollowersListPresenterProtocol? { get set }
    }

protocol FollowersListInteractorOutputProtocol {
    func getDataSuccessfully()
    func failedGettingData()
}

protocol FollowersListRouterProtocol {
    
}

protocol FollowerCellView {
    func configure(cellView: FollowersCellView)
}
