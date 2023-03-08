//
//  LoginService.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 07/03/23.
//

import Foundation

protocol LoginServiceProtocol{
    func login(_ requestModel: LoginRequestModel, completion: @escaping (LoginState) -> Void)
}

// MARK: - LoginService
final class LoginService:LoginServiceProtocol{
     private let dataManager = DBManager()
    func login(_ requestModel: LoginRequestModel, completion: @escaping (LoginState) -> Void){
        
        let dbRequestModel = dataManager.read()
        
        if dbRequestModel?.username == requestModel.username && dbRequestModel?.password == requestModel.password {
            UserDefaultsHelper.setData(value: true, key: .loginSuccess)
            completion(LoginState.loginSuccess)
        } else {
            completion(LoginState.errorMessage(Constants.invalidCredentialMessage))
        }
    }
}


