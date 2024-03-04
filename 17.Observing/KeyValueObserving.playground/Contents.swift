/**
 * Key-Path Observing
 */
import Foundation

class MyClass: NSObject {
    // Key-Value
    @objc dynamic var numberValue: Int
    
    func increse() {
        numberValue += 1
    }
    
    override init() {
        numberValue = 0
        super.init()
    }
}

let obj = MyClass()

obj.observe(\.numberValue, options: [.old, .new]) { object, change in
    print("Observer-1 : \(change.oldValue) -> \(change.newValue)")
}

obj.increse()

// 옵저버 객체. 새로운 값만 취급(.new)
let observation: NSKeyValueObservation = obj.observe(\.numberValue, options: [.new]) { object, change in
    print("Observer-2 works. \(change.oldValue) -> \(change.newValue)")
}

// Observer-1, 2 동작
obj.increse()

// 옵저버 해제
observation.invalidate()

// Observer-1만 동작
obj.increse()


//
// Observer 타입 정의 - old school
class MyClassObserver: NSObject {
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("MyClassObserver works \(change![NSKeyValueChangeKey.oldKey]) -> \(change![NSKeyValueChangeKey.newKey])")
    }
}

let observer = MyClassObserver()

// 옵저버 객체 등록. newValue만 구독
obj.addObserver(observer, forKeyPath: #keyPath(MyClass.numberValue), options: [.old, .new], context: nil)

obj.increse()


//
// Swift의 구조체/클래스의 프로퍼티 변경 감시 - 객체 내부에서 탐지
struct PropertyObserver {
    var value: Int = 0 {
        willSet {
            print("value will change. new value : \(newValue)")
        }
        
        didSet {
            print("value did changed. old value : \(oldValue)")
        }
    }
}

var propertyObserver = PropertyObserver()
propertyObserver.value = 10

