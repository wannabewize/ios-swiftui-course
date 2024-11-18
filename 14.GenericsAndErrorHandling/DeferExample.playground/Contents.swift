import Foundation

enum MyError: Error {
    case someError
}

//
// 에러가 발생하는 코드 defer 동작 확인
func doIt1() throws {
    defer {
        print("trial-2 - defer 동작")
    }
    
    throw MyError.someError
}

try? doIt1()

//
// 에러가 발생하지 않는 코드에 적용하기
func doIt2() {
    print("doIt-2 동작")
    defer {
        print("trial-2 - defer 동작")
    }
}

doIt2()


func doIt3() throws {
    throw MyError.someError
    
    defer {
        print("trial-3 - 동작")
    }
}

try? doIt3()


func doIt4() throws {
    defer {
        print("trial-4 - 동작 - 1")
    }
    
    defer {
        print("trial-4 - 동작 - 2")
    }
    throw MyError.someError
}

try? doIt4()
