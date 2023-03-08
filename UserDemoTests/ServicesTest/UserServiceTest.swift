//
//  UserServiceTest.swift
//  UserDemoTests
//
//  Created by Shrawan Kumar sharma on 09/03/23.
//

import XCTest
@testable import UserDemo

class UserServiceMock:UserServiceProtocol{
    static let userList = [User(id: 1212, username: "Shrawan", name: "Shrawan", email: "shrawan25.sharma@gmail.com", website: "https://www.google.com", phone: "+9123123", company: Company(name: "Google", bs: "bs", catchPhrase: "Catch phrase"), address: Address(street: "Steet", city: "City", zipCode: "21231", suite: "Suite", geo: GeoLocation(lat: "12", lng: "12")))]

    func fetchUserList(completion: @escaping ([User]?, Error?) -> Void){
        completion(UserServiceMock.userList, nil)
    }
}

final class UserServiceTest: XCTestCase {

    var sut:UserViewModel!
    var mockAPIService:UserServiceMock!

    override func setUpWithError() throws {
        mockAPIService = UserServiceMock()
        sut = UserViewModel(service: mockAPIService)
    }

    override func tearDownWithError() throws {
        sut = nil
        mockAPIService = nil
    }

    func testViewModelUserListAfterFetchingData() throws {
        sut.fetchData {
            XCTAssertTrue(self.sut.users == UserServiceMock.userList)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
