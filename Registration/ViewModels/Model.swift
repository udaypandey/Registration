//
//  Model.swift
//  Registration
//
//  Created by Uday Pandey on 20/01/2020.
//  Copyright © 2020 Uday Pandey. All rights reserved.
//

import Foundation

protocol ModelType {
    var firstName: String { get }
    var lastName: String { get }
    
//    var email: String { get }
}

struct Model: ModelType {
    var firstName: String
    var lastName: String
}

extension Model {
    static let sharedInstance = Model(firstName: "Robert", lastName: "Smith-Patterson")
}
