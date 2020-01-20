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
        //TODO: Placeholder checks
        return firstName.count > 3
    }
    
    static func isValid(lastName: String) -> Bool {
        //TODO: Placeholder checks
        return lastName.count > 5
    }
}

