//
//  PasswordViewModel.swift
//  Registration
//
//  Created by Uday Pandey on 20/01/2020.
//  Copyright © 2020 Uday Pandey. All rights reserved.
//

import RxSwift
import RxCocoa

struct PasswordViewModel: ViewModelType {
    let input: Input
    let output: Output
    
    init() {
        let changedText = BehaviorSubject<String>(value: "")
        let returnTapped = BehaviorSubject<Void>(value: ())
        let continueTapped = BehaviorSubject<Void>(value: ())
        
        input = Input(textChangedObserver: changedText.asObserver(),
                      returnTappedObserver: returnTapped.asObserver(),
                      continueTappedObserver: continueTapped.asObserver())
        
        let passwordValidation = changedText
            .map { Validator.isValid(password: $0) }
        
        let minimumLength = passwordValidation
            .map { $0.contains(.minimumCharacters) }
        
        let capitalLetter = passwordValidation
            .map { $0.contains(.capitalLetter) }
        
        let numberUsed =  passwordValidation
            .map { $0.contains(.number) }
        
        output = Output(minimumLength: <#T##Driver<Bool>#>, capitalLetterValidation: <#T##Driver<Bool>#>, numberUseValidation: <#T##Driver<Bool>#>, continueButtonEnabled: <#T##Driver<Bool>#>)
    }
}

extension PasswordViewModel {
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

extension PasswordViewModel {
    struct Output {
        let minimumLength: Driver<Bool>
        let capitalLetterValidation: Driver<Bool>
        let numberUseValidation: Driver<Bool>
        
        let continueButtonEnabled: Driver<Bool>
    }
}
