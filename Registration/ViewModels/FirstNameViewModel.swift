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
        
        let buttonEnabled = changedText
            .map { Validator.isValid(firstName: $0) ? true : false }
            .asDriver(onErrorJustReturn: false)
        
        input = Input(textChangedObserver: changedText.asObserver(),
                      returnTappedObserver: returnTapped.asObserver(),
                      continueTappedObserver: continueTapped.asObserver())
        output = Output(isValid: buttonEnabled)
    }
}

extension FirstNameViewModel {
    struct Input {
        let textChangedObserver: AnyObserver<String>
        func textChanged(_ text: String) {
            textChangedObserver.onNext(text)
        }
        
        let returnTappedObserver: AnyObserver<Void>
        func returnTapped() {
            returnTappedObserver.onNext(())
        }
        
        let continueTappedObserver: AnyObserver<Void>
        func continueTapped() {
            continueTappedObserver.onNext(())
        }
    }
}

extension FirstNameViewModel {
    struct Output {
        let isValid: Driver<Bool>
    }
}
