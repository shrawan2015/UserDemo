//
//  LoginServiceTest.swift
//  UserDemoTests
//
//  Created by Shrawan Kumar sharma on 09/03/23.
//

import XCTest
@testable import UserDemo

class LoginServiceMock:LoginServiceProtocol{
    func login(_ requestModel: LoginRequestModel, completion: @escaping (LoginState) -> Void) {
        completion(LoginState.loginSuccess)
    }
}

let loginViewModel = LoginViewModel(service: LoginServiceMock())

class LoginViewModelMock:LoginViewModelProtocol{
    func login(request: LoginRequestModel, completion: @escaping (LoginState) -> Void) {
        completion(LoginState.loginSuccess)
    }
    
    func validateLogin(request: LoginRequestModel) -> LoginState {
        .loginSuccess
    }
}


final class LoginServiceTest: XCTestCase {

    // MARK: - Subject under test
    var sut: LoginService!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = LoginService()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
