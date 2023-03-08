//
//  IsUserLogin.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 08/03/23.
//

import Foundation

// MARK: - IsUserLogin
public class UserLogin {
    
    public static var hasOnboarded: Bool {
        get {
            return UserDefaultsHelper.getData(type: Bool.self, forKey: .loginSuccess) ?? false
        }
        set(newValue) {
            UserDefaultsHelper.setData(value: newValue, key: .loginSuccess)
        }
    }
}
