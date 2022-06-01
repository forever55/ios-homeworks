//
//  FirstTabBarViewController.swift
//  Navigation
//
//  Created by Alexander on 28.05.2022.
//

import UIKit

class FirstTabBarViewController: UITabBarController {

    let firstVC = FeedViewController()
    let secondVC = LogInViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }

    private func setupControllers() {
        
        let firstNavController = UINavigationController(rootViewController: firstVC)
        firstVC.tabBarItem.title = "Feed"
        firstVC.tabBarItem.image = UIImage(named: "4655650")
        firstVC.navigationItem.title = "Лента пользователя"
        
        let secondNavController = UINavigationController(rootViewController: secondVC)
        secondVC.tabBarItem.title = "Profile"
        secondVC.tabBarItem.image = UIImage(named: "4655707")
        secondVC.navigationItem.title = ""
        
        viewControllers = [firstNavController, secondNavController]
    }
}
