//
//  LoginModel.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 07/03/23.
//

import Foundation


enum LoginState{
    case errorMessage(String)
    case loginSuccess
}

struct LoginRequestModel {
    var username:String
    var password:String
    var country:String
}

extension LoginRequestModel{
    init(username:String, password:String) {
        self.username = username
        self.password = password
        self.country = ""
    }
}
