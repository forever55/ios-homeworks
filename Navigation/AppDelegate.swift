//
//  AppDelegate.swift
//  Navigation
//
//  Created by Ниночка on 23.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = FirstTabBarViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

