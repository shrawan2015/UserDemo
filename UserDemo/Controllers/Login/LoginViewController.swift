//
//  LoginViewController.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 06/03/23.
//

import UIKit

// MARK: - LoginViewController
class LoginViewController: BaseViewController {
   
    // MARK: - IBOutlets
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var userNameTextField: CustomTextField!
    @IBOutlet weak var chooseCountryTextField: CustomTextField!
    @IBOutlet weak var loginButtonOutlet: UIButton!
    
    // MARK: - Internal Properties
    let loginViewModel = LoginViewModel(interator: LoginInteractor())
}

// MARK: - View Life Cycle
extension LoginViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        initialConfiguration()
    }
}


// MARK: - Initial Configuration
extension LoginViewController{
    func initialConfiguration(){
        userNameTextField.textFieldType = .default
        passwordTextField.textFieldType = .password
        chooseCountryTextField.configurePicker()
        hideKeyboardWhenTappedAround()
    }
}

// MARK: - IBActions Methods
extension LoginViewController{
    @IBAction func loginButtonAction(_ sender: UIButton) {
        let request = LoginRequestModel(username: userNameTextField.text ?? "", password: passwordTextField.text ?? "", country: chooseCountryTextField.text ?? "" )
        login(request: request)
    }
}

// MARK: - WebService
extension LoginViewController{
    func login(request:LoginRequestModel){
        loginViewModel.login(request: request) { [weak self] (state) in
            switch state {
            case .errorMessage(let errorMessage):
                self?.showAlertMessage(title: errorMessage)
            case .loginSuccess:
                self?.navigateToUserListScreen()
            }
        }
    }
}

// MARK: - Navigation
extension LoginViewController{
    func navigateToUserListScreen(){
        let rootVC = CustomerListViewController()
        let navController = UINavigationController(rootViewController: rootVC)
        let window = UIWindow.key
        window?.rootViewController = navController
    }
}
