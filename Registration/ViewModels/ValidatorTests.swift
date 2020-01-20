//
//  ValidatorTests.swift
//  RegistrationTests
//
//  Created by Uday Pandey on 20/01/2020.
//  Copyright © 2020 Uday Pandey. All rights reserved.
//

import XCTest
@testable import Registration

class ValidatorTests: XCTestCase {
    func testIsFirstNameValid() {
        XCTAssertFalse(Validator.isValid(firstName: ""))
        
        XCTAssertFalse(Validator.isValid(firstName: "R"))
        XCTAssertFalse(Validator.isValid(firstName: "Ro"))
        XCTAssertFalse(Validator.isValid(firstName: "Rob"))

        XCTAssertTrue(Validator.isValid(firstName: "Robert"))
        XCTAssertTrue(Validator.isValid(firstName: "RobertRobertRobertRobertRobertRobertRobert"))
    }
    
    func testIsLastNameValid() {
        XCTAssertFalse(Validator.isValid(lastName: ""))
        
        XCTAssertFalse(Validator.isValid(lastName: "S"))
        XCTAssertFalse(Validator.isValid(lastName: "Sm"))
        XCTAssertFalse(Validator.isValid(lastName: "Smi"))
        XCTAssertFalse(Validator.isValid(lastName: "Smit"))
        XCTAssertFalse(Validator.isValid(lastName: "Smith"))

        XCTAssertTrue(Validator.isValid(lastName: "Smith-Patterson"))
        XCTAssertTrue(Validator.isValid(lastName: "Smith-Patterson-Patterson-Patterson-Patterson-Patterson"))
    }

    func testIsEmailValid() {
        XCTAssertFalse(Validator.isValid(email: ""))
        
        XCTAssertFalse(Validator.isValid(email: "robert"))
        XCTAssertFalse(Validator.isValid(email: "robert.smith"))
        XCTAssertFalse(Validator.isValid(email: "robert.smith.patterson1990"))
        
        XCTAssertTrue(Validator.isValid(email: "robert.smith.patterson1990@gmail.com"))
        XCTAssertTrue(Validator.isValid(email: "robert.smith.patterson1990@gmail.com robert.smith.patterson1990@gmail.com"))
    }

}
