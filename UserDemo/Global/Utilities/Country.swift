//
//  Country.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 08/03/23.
//

import Foundation

// MARK: - Country
struct Country{
    // MARK: - Get Country List
    static func getCountries() -> [String] {
        var countries = [String]()
        for code in NSLocale.isoCountryCodes  {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            countries.append(name)
        }

        return countries
    }

}
