//
//  UserDetailsVC.swift
//  ViperGithub
//
//  Created by Eslam on 7/14/20.
//  Copyright © 2020 ioslam.co. All rights reserved.
//

import UIKit

class UserDetailsVC: UIViewController, UserDetailsViewProtocol {
    func showTitle(with username: String) {
        title = username
    }
    
    var presenter: UserDetailsPresenterProtocol!
        
    func showHideIndicator(isHidden: Bool, title: String?) {
        print("show ...")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        presenter?.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
