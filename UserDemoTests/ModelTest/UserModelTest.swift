//
//  UserModelTest.swift
//  UserDemoTests
//
//  Created by Shrawan Kumar sharma on 09/03/23.
//

import XCTest
@testable import UserDemo
import CoreLocation

final class UserModelTest: XCTestCase {

    var user:User!
    var address:Address!
    var geolocation:GeoLocation!
    var invalidGeoLocation:GeoLocation!
    
    override func setUpWithError() throws {
        geolocation = GeoLocation(lat: "12.2", lng: "12312312.121")
        invalidGeoLocation = GeoLocation(lat: "latitude", lng: "12312312.121")
        address = Address(street: "Street", city: "City", zipCode: "1231231", suite: "suite", geo: geolocation)
    }

    override func tearDownWithError() throws {
        user = nil
        address = nil
        geolocation = nil
        invalidGeoLocation = nil
    }

    func testFullAddress() throws {
        XCTAssertTrue(address.getFullAddress() == "Street City 1231231 suite")
        XCTAssertFalse(address.getFullAddress() == "")
    }
    
    func testGeolocationLatitude() throws {
        XCTAssertTrue("12.2" == geolocation.lat)
    }
    
    func testGeolocationLocationCoordinate() throws {
        XCTAssertTrue(geolocation.locationCoordinate == CLLocationCoordinate2D(latitude: 12.2, longitude: 12312312.121))
    }

    func testGeolocatioInvalidLocationCoordinate() throws {
        XCTAssertTrue(invalidGeoLocation.locationCoordinate == nil)
    }
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
