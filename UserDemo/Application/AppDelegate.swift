//
//  AppDelegate.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 05/03/23.
//

import UIKit

@main
class AppDelegate: UIResponder {
    // MARK: - Internal Properties
    var window:UIWindow?
}

// MARK: - UIApplicationDelegate
extension AppDelegate:UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        applicationState()
        return true
    }
}

