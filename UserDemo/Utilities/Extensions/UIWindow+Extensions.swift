//
//  UIWindow+Extensions.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 08/03/23.
//

import Foundation
import UIKit

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
