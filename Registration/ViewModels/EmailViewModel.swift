//
//  EmailViewModel.swift
//  Registration
//
//  Created by Uday Pandey on 20/01/2020.
//  Copyright © 2020 Uday Pandey. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct EmailViewModel: ViewModelType {
    let input: Input
    let output: Output
    
    //TODO: Placeholder till we design model layer
    let model: Model
    
    init(model: Model) {
        self.model = model
        
        let changedText = BehaviorSubject<String>(value: "")
        let returnTapped = BehaviorSubject<Void>(value: ())
        let continueTapped = BehaviorSubject<Void>(value: ())
        let helpTapped = BehaviorSubject<Void>(value: ())
        
        input = Input(textChangedObserver: changedText.asObserver(),
                      returnTappedObserver: returnTapped.asObserver(),
                      continueTappedObserver: continueTapped.asObserver(),
                      helpTappedObserver: helpTapped.asObserver())
        
        
        let userMessageString = "Thanks \(model.firstName).\nWhat’s your email address?"
        let userMessage = Observable<String>.just(userMessageString)
            .asDriver(onErrorJustReturn: userMessageString)
        
        let isValid = changedText
            .map { Validator.isValid(email: $0) ? true : false }
            .asDriver(onErrorJustReturn: false)

        //TODO: Will there be more granular error messages? Then should ideally move
        // error code and strings to a separate entity
        let errorMessage = changedText
            .map { text in
                if text.isEmpty {
                    return true
                }
                return Validator.isValid(email: text) ? true : false
            }
            .map { $0 ? "" : "Looks like your email format isn't correct."}
            .asDriver(onErrorJustReturn: "")
        
        output = Output(userMessage: userMessage, isValid: isValid, errorMessage: errorMessage)
    }
}

extension EmailViewModel {
    struct Input {
        private let textChangedObserver: AnyObserver<String>
        func textChanged(_ text: String) {
            textChangedObserver.onNext(text)
        }
        
        private let returnTappedObserver: AnyObserver<Void>
        func returnTapped() {
            returnTappedObserver.onNext(())
        }
        
        private let continueTappedObserver: AnyObserver<Void>
        func continueTapped() {
            continueTappedObserver.onNext(())
        }
        
        private let helpTappedObserver: AnyObserver<Void>
        func helpTapped() {
            helpTappedObserver.onNext(())
        }

        init(textChangedObserver: AnyObserver<String>,
             returnTappedObserver: AnyObserver<Void>,
             continueTappedObserver: AnyObserver<Void>,
             helpTappedObserver: AnyObserver<Void>) {
            self.textChangedObserver = textChangedObserver
            self.returnTappedObserver = returnTappedObserver
            self.continueTappedObserver = continueTappedObserver
            self.helpTappedObserver = helpTappedObserver
        }
    }
}

extension EmailViewModel {
    struct Output {
        let userMessage: Driver<String>
        let isValid: Driver<Bool>
        let errorMessage: Driver<String>
    }
}
