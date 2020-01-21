import UIKit
import RxSwift

let b = BehaviorSubject<Void>(value: ())
let a = b.scan(false) { secure, _ in
    !secure
}

a.subscribe(onNext: { elm in
    print("secure: \(elm)")
})

b.onNext(())
b.onNext(())
b.onNext(())
b.onNext(())
b.onNext(())
b.onNext(())
b.onNext(())
b.onNext(())
b.onNext(())

