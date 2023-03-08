//
//  Appdelegate+Extensions.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 08/03/23.
//

import Foundation
import UIKit

extension AppDelegate{
    final func checkLoginStatus(){
        if IsUserLogin.hasOnboarded{
            let navController = UINavigationController(rootViewController: CustomerListViewController())
            setRootViewController(navController,animated: true)
        }else{
            setRootViewController(LoginViewController(),animated: true)
        }
    }
}

extension AppDelegate {
    final func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(
            with: window,
            duration: 1,
            options: .transitionCurlUp,
            animations: nil,
            completion: nil)
    }
}

