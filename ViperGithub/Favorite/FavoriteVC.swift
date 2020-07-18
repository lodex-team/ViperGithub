//
//  FavoriteVC.swift
//  ViperGithub
//
//  Created by Eslam on 7/14/20.
//  Copyright © 2020 ioslam.co. All rights reserved.
//

import UIKit

class FavoriteVC: UIViewController, FavoriteViewProtocol {
    
    var presenter: FavoritePresenterProtocol!
    let actionButton = GHButton(backgroundColor: .systemBlue, title: "")
    let dismissButton = UIButton()
    let gh_iv = UIImageView()
    let search_textfield = GHTextField()
    let search_button = GHButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var userNotEmpty: Bool {
    let textField = search_textfield.text!.trimmingCharacters(in: .whitespaces)
    return !textField.isEmpty }
    
    
    func showHideSpinner(isHidden: Bool, title: String?) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.view.backgroundColor = .systemBackground
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.createGHImage()
            self.createSearchTextfield()
            self.createSearchButton()
            self.dismissKeyboard()
        }
        presenter?.viewDidLoad()
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        view.endEditing(true)
    }
}
//MARK: - UI
extension FavoriteVC {
    
    //MARK: - create `Github` Image layout
    fileprivate func createGHImage() {
        view.addSubview(gh_iv)
        gh_iv.translatesAutoresizingMaskIntoConstraints = false
        gh_iv.image = UIImage(named: "gh-logo")!
        NSLayoutConstraint.activate([
            gh_iv.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            gh_iv.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            gh_iv.heightAnchor.constraint(equalToConstant: 200),
            gh_iv.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    //MARK: - create `search` text field layout
    fileprivate func createSearchTextfield() {
        view.addSubview(search_textfield)
        search_textfield.delegate = self
        NSLayoutConstraint.activate([
            search_textfield.topAnchor.constraint(equalTo: gh_iv.bottomAnchor, constant: 44),
            search_textfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            search_textfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            search_textfield.heightAnchor.constraint(equalToConstant: 44)
        ])
        
    }
    //MARK: - create `Search` Button layout
    fileprivate func createSearchButton() {
        search_button.addTarget(nil, action: #selector(validateTextfield), for: .touchUpInside)
        search_button.backgroundColor = .systemBlue
        view.addSubview(search_button)
        NSLayoutConstraint.activate([
            search_button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            search_button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            search_button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            search_button.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    //MARK: - show alert view layout
    fileprivate func createAlertView() {
        dismissButton.addTarget(self, action: #selector(tabToDismiss), for: .touchUpInside)
        actionButton.addTarget(self, action: #selector(tabToDismiss), for: .touchUpInside)
        view.setAlertView(title: "Empty Username",
                          message: GHError.emptyUsername.rawValue,
                          buttonTitle: "OK",
                          actionButton: actionButton,
                          dismissButton: dismissButton)
        view.endEditing(true)
    }
    
    func showError(errorMsg: String) {
           self.view.setAlertView(title: "Invalid Username",
                                  message: errorMsg,
                                  buttonTitle: "OK",
                                  actionButton: actionButton,
                                  dismissButton: dismissButton)
        view.endEditing(true)
       }
    //MARK: - IBActions & UIGesture Recognizer
    
    //MARK: - click anywhere in the view to dismiss the keyboard
    func dismissKeyboard() {
        let tab = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tab)
    }
    
    //MARK: - Search Button Action
    @objc func searchButtonPressed() {
        validateTextfield()
    }
}

//MARK: - UITextfield Delegates
extension FavoriteVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        validateTextfield()
        return true
    }
    
    //MARK: - validate if the username is not empty
    @objc fileprivate func validateTextfield() {
        guard userNotEmpty else {
            search_textfield.text = ""
            createAlertView()
            return
        }
        displayUserDetails()
    }
    
    //MARK: - go to user details vc to display
    func displayUserDetails() {
        presenter.searchFollowers(by: search_textfield.text!)
        search_textfield.text = ""
    }
    //MARK: - what happens when something wrong when user get bad request
    func showErrorAlert(with errorMessage: GHError) {
        self.view.setAlertView(title: "OPPS", message: errorMessage.rawValue, buttonTitle: "OK", actionButton: actionButton, dismissButton: dismissButton)
    }
    
    @objc func tabToDismiss() {
        print("tabToDismiss")
    }
}
