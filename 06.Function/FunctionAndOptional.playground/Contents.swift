import Foundation

// nil 반환하는 함수
func sayHello(who : String?) {
    // 파라미터를 옵셔널 바인딩
    if let who = who {
        print("Hello \(who)")
    }
    else {
        print("Hello World")
    }
}

sayHello(who: "Swift")
sayHello(who: nil)


