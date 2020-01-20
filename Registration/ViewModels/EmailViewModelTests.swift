//
//  EmailViewModelTests.swift
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

class EmailViewModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmailTextInput() {
        let scheduler = ConcurrentDispatchQueueScheduler(qos: .default)
        
        let model = Model.sharedInstance
        let viewModel = EmailViewModel(model: model)
        
        let userMessage = viewModel.output.userMessage
            .asObservable()
            .subscribeOn(scheduler)
        let errorMessage = viewModel.output.errorMessage
            .asObservable()
            .subscribeOn(scheduler)

        // Steady state values
        let errorMessageString = "Looks like your email format isn't correct."
        let userMessageString = "Thanks \(model.firstName).\nWhat’s your email address?"
        XCTAssertEqual(try userMessage.toBlocking().first(), userMessageString)
        XCTAssertEqual(try errorMessage.toBlocking(timeout: 1.0).first(), "")

        let enabled = viewModel.output.isValid
            .asObservable()
            .subscribeOn(scheduler)
        

        // Startup values
        // Ensure button is disabled at the start
        XCTAssertEqual(try enabled.toBlocking().first(), false)
        //TODO: This error will surface to quickly, should have a better
        // logic on when to surface
        XCTAssertEqual(try errorMessage.toBlocking().first(), "")

        // First few letters
        viewModel.input.textChanged("robert")
        // Ensure button is disabled at the start
        XCTAssertEqual(try enabled.toBlocking().first(), false)
        XCTAssertEqual(try errorMessage.toBlocking().first(), errorMessageString)

        
        viewModel.input.textChanged("robert.smith")
        // Ensure button is disabled at the start
        XCTAssertEqual(try enabled.toBlocking().first(), false)
        XCTAssertEqual(try errorMessage.toBlocking().first(), errorMessageString)

        viewModel.input.textChanged("robert.smith.patterson1990")
        // Ensure button is disabled at the start
        XCTAssertEqual(try enabled.toBlocking().first(), false)
        XCTAssertEqual(try errorMessage.toBlocking().first(), errorMessageString)


        // More letters
        viewModel.input.textChanged("robert.smith.patterson1990@gmail.com")
        // Ensure button is disabled at the start
        XCTAssertEqual(try enabled.toBlocking().first(), true)
        XCTAssertEqual(try errorMessage.toBlocking().first(), "")

        
        // Clear out text, ensure button is disabled again
        viewModel.input.textChanged("")
        // Ensure button is disabled at the start
        XCTAssertEqual(try enabled.toBlocking().first(), false)
        XCTAssertEqual(try errorMessage.toBlocking().first(), "")

        // Final name input
        viewModel.input.textChanged("robert.smith.patterson1990@gmail.com")
        // Ensure button is disabled at the start
        XCTAssertEqual(try enabled.toBlocking().first(), true)
        XCTAssertEqual(try errorMessage.toBlocking().first(), "")
    }
}
