//
//  ValidationService.swift
//  UnitTest
//
//  Created by sarath kumar on 12/10/20.
//  Copyright © 2020 sarath kumar. All rights reserved.
//

import Foundation

struct ValidationService {
    
    func validateUsername(username: String?) throws -> String {
        guard let username = username else { throw ValidationError.invalidValue }
        guard username.count > 3 else { throw ValidationError.usernameTooShort }
        guard username.count < 20 else { throw ValidationError.usernameTooLong }
        return username
    }
    
    func validatePassword(password: String?) throws -> String {
        guard let password = password else { throw ValidationError.invalidValue }
        guard password.count >= 8 else { throw ValidationError.passwordTooShort }
        guard password.count < 20 else { throw ValidationError.passwordTooLong }
        return password
    }
}

enum ValidationError: LocalizedError {
    case invalidValue
    case passwordTooLong
    case passwordTooShort
    case usernameTooLong
    case usernameTooShort
    
    var errorDescription: String? {
        switch self {
        case .invalidValue:
            return "You have entered the invalid value"
        case .passwordTooLong:
            return "password is too long"
        case .passwordTooShort:
            return "passwordTooShort"
        case .usernameTooLong:
            return "usernameTooLong"
        case .usernameTooShort:
            return "usernameTooShort"
        }
    }
}
