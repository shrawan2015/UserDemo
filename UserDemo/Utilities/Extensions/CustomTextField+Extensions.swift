//
//  CustomTextField+Extensions.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 08/03/23.
//

import Foundation
import UIKit

// MARK: -  Enum
extension CustomTextField {
    enum TextFieldType: Equatable {
        case `default`
        case login
        case password        
        var keyboarType: UIKeyboardType {
            get {
                switch self {
                case .default, .login, .password:
                    return UIKeyboardType.default
                }
            }
        }
        
        var textContentType: UITextContentType {
            get {
                switch self {
                case .default, .login:
                    return UITextContentType.name
                case .password:
                    return UITextContentType.password
                }
            }
        }
    }
}
