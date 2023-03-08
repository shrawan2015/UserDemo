//
//  LoginIteractor.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 07/03/23.
//

import Foundation

protocol LoginInteractorProtocol{
    func login(_ requestModel: LoginRequestModel, completion: @escaping (LoginState) -> Void)
}

// MARK: - LoginInteractor
final class LoginInteractor:LoginInteractorProtocol{
     private let db = DBManager()
    func login(_ requestModel: LoginRequestModel, completion: @escaping (LoginState) -> Void){
        
        let loginUserDetail = db.read()
        
        if loginUserDetail?.username == requestModel.username && loginUserDetail?.password == requestModel.password {
            UserDefaultsHelper.setData(value: true, key: .loginSuccess)
            completion(LoginState.loginSuccess)
        } else {
            completion(LoginState.errorMessage("User Name or Password Incorrect."))
        }
    }
}


