//
//  FirstNameViewModel.swift
//  Registration
//
//  Created by Uday Pandey on 20/01/2020.
//  Copyright © 2020 Uday Pandey. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct FirstNameViewModel: ViewModelType {
    let input: Input
    let output: Output
    
    init() {
        let changedText = BehaviorSubject<String>(value: "")
        let returnTapped = BehaviorSubject<Void>(value: ())
        let continueTapped = BehaviorSubject<Void>(value: ())
        
        let isValid = changedText
            .map { Validator.isValid(firstName: $0) ? true : false }
            .asDriver(onErrorJustReturn: false)
        
        input = Input(textChangedObserver: changedText.asObserver(),
                      returnTappedObserver: returnTapped.asObserver(),
                      continueTappedObserver: continueTapped.asObserver())
        output = Output(isValid: isValid)
    }
}

extension FirstNameViewModel {
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

extension FirstNameViewModel {
    struct Output {
        let isValid: Driver<Bool>
    }
}
