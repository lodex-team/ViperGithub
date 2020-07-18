//
//  SearchInteractor.swift
//  ViperGithub
//
//  Created by Eslam on 7/14/20.
//  Copyright © 2020 ioslam.co. All rights reserved.
//

import Foundation

class SearchInteractor: SearchInteractorInputProtocol {
    var presenter: SearchInteractorOutputProtocol?
    
    func getUser(with username: String) {
        NetworkManager.shared.getUserDetails(with: username) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                self.presenter?.getDataWithError(errorMsg: error)
                print(error)
            case .success(let user ):
                self.presenter?.getDataSuccessfully(user: user)
            }
        }
    }
    
    
}
