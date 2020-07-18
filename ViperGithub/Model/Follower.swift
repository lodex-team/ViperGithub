//
//  Follower.swift
//  iGitHub
//
//  Created by Eslam on 7/12/20.
//  Copyright © 2020 ioslam.co. All rights reserved.
//

import Foundation
struct Follower: Codable {
    let login: String
    let avatarUrl: String
}
struct FollowersCellView {
    var login: String
    var avatarUrl: String
    init(with follower: Follower ) {
        login = follower.login
        avatarUrl = follower.avatarUrl
    }
}
