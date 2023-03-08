//
//  UserDemoTests.swift
//  UserDemoTests
//
//  Created by Shrawan Kumar sharma on 05/03/23.
//

import XCTest
@testable import UserDemo

final class UserDemoTests: XCTestCase {

    var user:User!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        user = User(id: 1212, username: "Username", name: "Password", email: "shrawan25.sharma@gmail.com", website: "https://www.google.com", phone: "+918812312", company: Company(name: "Google", bs: "bs", catchPhrase: "Catch phrase"), address: Address(street: "Street", city: "City", zipCode: "12312", suite: "suite", geo: GeoLocation(lat: "12.2", lng: "22.4")))
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        XCTAssertFalse(user.address.getFullAddress() == "")
        XCTAssertTrue(user.address.getFullAddress() == "Street City 12312 suite")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
