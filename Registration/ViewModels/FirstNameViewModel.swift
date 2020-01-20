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
        let userName = BehaviorSubject<String>(value: "")
        let returnPressed = BehaviorSubject<Void>(value: ())
        
        let buttonEnabled = userName
            .map { Validator.isValid(firstName: $0) ? true : false }
            .asDriver(onErrorJustReturn: false)
        
        input = Input(userNameText: userName.asObserver(), returnPressed: returnPressed.asObserver())
        output = Output(buttonEnabled: buttonEnabled)
    }
}

extension FirstNameViewModel {
    struct Input {
        let userNameText: AnyObserver<String>
        func textChanged(_ text: String) {
            userNameText.onNext(text)
        }
        
        let returnPressed: AnyObserver<Void>
        func returnButtonPressed() {
            returnPressed.onNext(())
        }
    }
}

extension FirstNameViewModel {
    struct Output {
        let buttonEnabled: Driver<Bool>
    }
}
