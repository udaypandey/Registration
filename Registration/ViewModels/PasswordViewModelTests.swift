//
//  PasswordViewModelTests.swift
//  RegistrationTests
//
//  Created by Uday Pandey on 20/01/2020.
//  Copyright © 2020 Uday Pandey. All rights reserved.
//

import XCTest

import RxSwift
import RxCocoa
import RxBlocking
@testable import Registration

class PasswordViewModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
//    func testPasswordTextInput() {
//        let scheduler = ConcurrentDispatchQueueScheduler(qos: .default)
//        
//        let model = Model.sharedInstance
//        let viewModel = PasswordViewModel(model: model)
//        
//        let userMessage = viewModel.output.userMessage
//            .asObservable()
//            .subscribeOn(scheduler)
//        
//        let userMessageString = "Thanks \(model.firstName).\n What’s your surname?"
//        XCTAssertEqual(try userMessage.toBlocking().first(), userMessageString)
//        
//        
//        let enabled = viewModel.output.isValid
//            .asObservable()
//            .subscribeOn(scheduler)
//        
//        // Startup values
//        // Ensure button is disabled at the start
//        XCTAssertEqual(try enabled.toBlocking().first(), false)
//        
//        // First few letters
//        viewModel.input.textChanged("Smi")
//        // Ensure button is disabled at the start
//        XCTAssertEqual(try enabled.toBlocking().first(), false)
//        
//        // More letters
//        viewModel.input.textChanged("Smith-")
//        // Ensure button is disabled at the start
//        XCTAssertEqual(try enabled.toBlocking().first(), true)
//        
//        // Clear out text, ensure button is disabled again
//        viewModel.input.textChanged("")
//        // Ensure button is disabled at the start
//        XCTAssertEqual(try enabled.toBlocking().first(), false)
//        
//        // Final name input
//        viewModel.input.textChanged("Smith-Patterson")
//        // Ensure button is disabled at the start
//        XCTAssertEqual(try enabled.toBlocking().first(), true)
//    }
}

