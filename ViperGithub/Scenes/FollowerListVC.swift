//
//  FollowerListVC.swift
//  iGitHub
//
//  Created by Eslam on 7/12/20.
//  Copyright © 2020 ioslam.co. All rights reserved.
//

import UIKit

class FollowerListVC: UIViewController {
    let actionButton = GHButton(backgroundColor: .systemBlue, title: "")
    let dismissButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.async {
            self.view.backgroundColor = .systemBackground
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
     }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
