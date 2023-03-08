//
//  UserModel.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 05/03/23.
//

import Foundation
import CoreLocation


struct User: Codable, Identifiable {
    let id: Int
    let username: String
    let name: String
    let email: String
    let website: String
    let phone: String
    let company: Company
    let address: Address

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case username = "username"
        case name = "name"
        case email = "email"
        case website = "website"
        case phone = "phone"
        case address = "address"
        case company = "company"
    }
}

// MARK: - Address
public struct Address: Codable {
    let street: String
    let city: String
    let zipCode: String
    let suite: String
    let geo: GeoLocation

    enum CodingKeys: String, CodingKey {
        case street = "street"
        case city = "city"
        case zipCode = "zipcode"
        case suite = "suite"
        case geo = "geo"
    }
}

extension Address{
    func getFullAddress() -> String{
        var address = ""
        if street.count != 0 {
            address = street
        }
        if city.count != 0 {
            address = address + " \(city)"
        }
        if zipCode.count != 0 {
            address = address + " \(zipCode)"
        }
        
        if suite.count != 0 {
            address = address + " \(suite)"
        }
        return address
    }
}

// MARK: - Geo
struct GeoLocation: Codable {
    let lat: String
    let lng: String

    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lng = "lng"
    }
}

extension GeoLocation{
    var locationCoordinate:CLLocationCoordinate2D?{
        if let latitude = Double(lat) , let longitude = Double(lng){
            let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            return location
        }
        return nil
    }
}

extension CLLocationCoordinate2D:Equatable{
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}

// MARK: - Company
public struct Company: Codable {
    let name: String
    let bs: String
    let catchPhrase: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case bs = "bs"
        case catchPhrase = "catchPhrase"
    }
}

extension User: Equatable{
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
}
