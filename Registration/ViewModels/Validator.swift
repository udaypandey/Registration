//
//  Validator.swift
//  Registration
//
//  Created by Uday Pandey on 20/01/2020.
//  Copyright © 2020 Uday Pandey. All rights reserved.
//

import Foundation

enum Validator {}

extension Validator {
    struct PasswordValidation: OptionSet {
        let rawValue: Int
        
        static let minimumCharacters = PasswordValidation(rawValue: 1 << 0)
        static let capitalLetter     = PasswordValidation(rawValue: 1 << 1)
        static let number            = PasswordValidation(rawValue: 1 << 2)
    }
}
extension Validator {
    static func isValid(firstName: String) -> Bool {
        //TODO: Placeholder checks
        return firstName.count > 3
    }
    
    static func isValid(lastName: String) -> Bool {
        //TODO: Placeholder checks
        return lastName.count > 5
    }
    
    static func isValid(email: String) -> Bool {
        //TODO: Placeholder checks
        return email.contains("@")
    }
    
    static func isValid(password: String) -> PasswordValidation {
        let ret: PasswordValidation = []
        return ret
    }

}

