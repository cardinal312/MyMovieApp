//
//  LoginController.swift
//  MyMovieApp
//
//  Created by Macbook on 29/4/24.
//

import UIKit

final class LoginController: UIViewController {
    
    // MARK: - UI Components
    private let headerView = AuthHeaderView(title: .loginTitle, subTitle: .loginSubTitle)
    private let userNameField = CustomTextField(fieldType: .userName)
    private let passwordField = CustomTextField(fieldType: .password)
    private let signInButton = CustomButton(title: "Sign In", hasBackground: true, fontSize: .big)
    private let newUserButton = CustomButton(title: "New User? Create Account.", fontSize: .med)
    private let forgotPasswordButton = CustomButton(title: "Forgot Password", fontSize: .small)
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        self.newUserButton.addTarget(self, action: #selector(didTapNewUserButton), for: .touchUpInside)
        self.forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPasswordButton), for: .touchUpInside)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
        self.didTapNewUserButton()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(headerView)
        self.view.addSubview(userNameField)
        self.view.addSubview(passwordField)
        
        self.view.addSubview(signInButton)
        self.view.addSubview(newUserButton)
        self.view.addSubview(forgotPasswordButton)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        userNameField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        newUserButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 222),
            
            self.userNameField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            self.userNameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.userNameField.heightAnchor.constraint(equalToConstant: 55),
            self.userNameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.passwordField.topAnchor.constraint(equalTo: userNameField.bottomAnchor, constant: 22),
            self.passwordField.centerXAnchor.constraint(equalTo: userNameField.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 22),
            self.signInButton.centerXAnchor.constraint(equalTo: userNameField.centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 55),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.newUserButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 11),
            self.newUserButton.centerXAnchor.constraint(equalTo: userNameField.centerXAnchor),
            self.newUserButton.heightAnchor.constraint(equalToConstant: 44),
            self.newUserButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.forgotPasswordButton.topAnchor.constraint(equalTo: newUserButton.bottomAnchor, constant: 6),
            self.forgotPasswordButton.centerXAnchor.constraint(equalTo: userNameField.centerXAnchor),
            self.forgotPasswordButton.heightAnchor.constraint(equalToConstant: 44),
            self.forgotPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
        ])
    }
    
    // MARK: - Selectors
    @objc private func didTapSignInButton() {
        let vc = HomeController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    @objc private func didTapNewUserButton() {
        let vc = RegisterController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapForgotPasswordButton() {
        let vc = ForfotPasswordController()
        self.navigationController?.pushViewController(vc, animated: true)    }
}
