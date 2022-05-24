//
//  FirstTabBarViewController.swift
//  Navigation
//
//  Created by Александр on 23.04.2022.
//

import UIKit

class FirstTabBarViewController: UITabBarController {

    let firstVC = ViewController()
    let secondVC = ProfileViewController()
    
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
        secondVC.navigationItem.title = "Profile"
        
        viewControllers = [firstNavController, secondNavController]
    }
}
