//
//  LoginViewModel.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 05/03/23.
//

import Foundation

protocol LoginViewModelProtocol{
    func login(request:LoginRequestModel,  completion: @escaping (LoginState) -> Void)
    func validateLogin(request:LoginRequestModel) -> LoginState
}

// MARK: - LoginViewModel
final class LoginViewModel:LoginViewModelProtocol {
  
    private let service:LoginServiceProtocol?
    
    init(service: LoginServiceProtocol?) {
        self.service = service
    }
}

// MARK: - Private Methods
extension LoginViewModel{

     func validateLogin(request:LoginRequestModel) -> LoginState{
        if request.username.isEmpty {
            return LoginState.errorMessage(Constants.emptyUsernameMessage)
        }
        
        if request.password.isEmpty {
            return(LoginState.errorMessage(Constants.emptyPasswordMessage))
            
        } else if inValidateTextLength(request.password) {
            return LoginState.errorMessage(Constants.passwordErrorMessage)
        }
        
        if request.country.isEmpty{
            return LoginState.errorMessage(Constants.emptyCountryMessage)
        }
        return .loginSuccess
    }
    
   
    private func inValidateTextLength(_ text: String) -> Bool {
        return (text.count < 6 )
    }
}

// MARK: - API Service
extension LoginViewModel{
    
    func login(request:LoginRequestModel,  completion: @escaping (LoginState) -> Void) {
        let isValidCredential = validateLogin(request: request)
        if  isValidCredential == .loginSuccess{
            service?.login(request) { response in
                completion(response)
            }
        }else{
            completion(isValidCredential)
        }
    }
    
}
