//
//  HomeController.swift
//  MyMovieApp
//
//  Created by Macbook on 29/4/24.
//

import UIKit

final class HomeController: UIViewController {
    
    // MARK: - Variables
    
    // MARK: - UI Components
    private let someLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.text = "Loading"
        label.numberOfLines = 2
        return label
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.someLabel.text = "CARDINAL 312"
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        
        view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didTapLogout))
        
        self.view.addSubview(someLabel)
        NSLayoutConstraint.activate([
            self.someLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.someLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    // MARK: - Selectors
    @objc private func didTapLogout() {
        
    }
    
    
}


