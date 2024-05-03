//
//  MainTabBarControllerViewController.swift
//  MyMovieApp
//
//  Created by Macbook on 2/5/24.
//

import UIKit

final class MainTabBarControllerViewController: UITabBarController {
 
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupControllers()
    }

    // MARK: - Methods
    private func setupControllers() {
        
        let vc1 = UINavigationController(rootViewController: HomeController())
        let vc2 = UINavigationController(rootViewController: UpcomingController())
        let vc3 = UINavigationController(rootViewController: SearchController())
        let vc4 = UINavigationController(rootViewController: ChatController())
        let vc5 = UINavigationController(rootViewController: DownloadsController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "message")
        vc5.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        vc1.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "play.circle.fill")
        vc3.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.fill")
        vc4.tabBarItem.selectedImage = UIImage(systemName: "message.fill")
        vc5.tabBarItem.selectedImage = UIImage(systemName: "arrow.down.to.line.fill")
        
        vc1.title = "Home"
        vc2.title = "Coming soon"
        vc3.title = "Search"
        vc4.title = "Chat"
        vc5.title = "Downloads"
        
        tabBar.tintColor = .label
        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
    }
}
