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
    static func isValid(firstName: String) -> Bool {
        return firstName.count > 3
    }
    
    static func isValid(lastName: String) -> Bool {
        return lastName.count > 3
    }
}

