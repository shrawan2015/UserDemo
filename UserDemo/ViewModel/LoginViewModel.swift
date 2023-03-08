//
//  LoginViewModel.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 05/03/23.
//

import Foundation

// MARK: - LoginViewModel
final class LoginViewModel {
  
    private let interator:LoginInteractorProtocol?
    
    init(interator: LoginInteractorProtocol?) {
        self.interator = interator
    }
}
// MARK: - Methods
extension LoginViewModel{
    // MARK: - Validation
    func login(request:LoginRequestModel,  completion: @escaping (LoginState) -> Void) {
        let username = request.username
        let password = request.password
        let country = request.country
        
        if username.isEmpty {
            completion(LoginState.errorMessage(Constants.emptyUsernameMessage))
            return
        }
        
        if password.isEmpty {
            completion(LoginState.errorMessage(Constants.emptyPasswordMessage))
            return
        } else if inValidateTextLength(password) {
            completion(LoginState.errorMessage(Constants.passwordErrorMessage))
            return
        }
        
        if country.isEmpty{
            completion(LoginState.errorMessage(Constants.emptyCountryMessage))
            return
        }
        
        interator?.login(request) { response in
            completion(response)
        }
    }
    
    private func inValidateTextLength(_ text: String) -> Bool {
        return (text.count < 6 )
    }
}
