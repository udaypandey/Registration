//
//  LastNameViewModel.swift
//  Registration
//
//  Created by Uday Pandey on 20/01/2020.
//  Copyright © 2020 Uday Pandey. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct LastNameViewModel: ViewModelType {
    let input: Input
    let output: Output
    
    //TODO: Placeholder till we design model layer
    let model: Model
    
    init(model: Model) {
        self.model = model
        
        let changedText = BehaviorSubject<String>(value: "")
        let returnTapped = BehaviorSubject<Void>(value: ())
        let continueTapped = BehaviorSubject<Void>(value: ())
        
        input = Input(textChangedObserver: changedText.asObserver(),
                      returnTappedObserver: returnTapped.asObserver(),
                      continueTappedObserver: continueTapped.asObserver())
        
        let isValid = changedText
            .map { Validator.isValid(lastName: $0) ? true : false }
            .asDriver(onErrorJustReturn: false)
        
        let userMessageString = "Thanks \(model.firstName).\n What’s your surname?"
        let userMessage = Observable<String>.just(userMessageString)
            .asDriver(onErrorJustReturn: userMessageString)

        output = Output(userMessage: userMessage, isValid: isValid)
    }
}

extension LastNameViewModel {
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
        
        init(textChangedObserver: AnyObserver<String>,
             returnTappedObserver: AnyObserver<Void>,
             continueTappedObserver: AnyObserver<Void>) {
            self.textChangedObserver = textChangedObserver
            self.returnTappedObserver = returnTappedObserver
            self.continueTappedObserver = continueTappedObserver
        }
    }
}

extension LastNameViewModel {
    struct Output {
        let userMessage: Driver<String>
        let isValid: Driver<Bool>
    }
}
