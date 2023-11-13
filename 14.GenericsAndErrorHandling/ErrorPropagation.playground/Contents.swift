import Foundation


let url = URL(string: "http://server.address/not.exist")!


// 에러 발생, 에러 처리
func errorHandledFunction() {
    do {
        let str = try String(contentsOf: url)
        print("str from url:", str)
    }
    catch let error {
        print("ERROR - errorHandledFunction")
    }
}

errorHandledFunction()

// 에러 발생 - 에러 전파
func errorThrowingFunction() throws {
    let str = try String(contentsOf: url)
    print("str from url:", str)
}

// 전파된 에러
do {
    try errorThrowingFunction()
}
catch {
    print("ERROR - errorThrowingFunction - Error :", error)
}


// 에러가 발생하는 클로저
func doIt(_ handler: () throws -> Void) {
    do {
        try handler()
    }
    catch {
        print("Error")
    }
}


doIt {
    let str = try String(contentsOf: url)
    print("str from url:", str)
}

// 클로저에서 발생한 에러 전파하기
func doIt2(_ handler: () throws -> Void) rethrows {
    try handler()
}

do {
    try doIt2 {
        let str = try String(contentsOf: url)
        print("str from url:", str)
    }
}
catch {
    print("Error")
}
