import Foundation

// 없는 주소로 만든 URL로 문자열 객체 생성 시 에러 발생
let url = URL(string: "http://server.address/not.exist")!

//
// 에러가 발생하지 않는 클로저와 함수
func doIt1(_ handler: () -> Void) {
    handler()
}

// 에러 - 함수 타입에 throws가 없어서 에러 발생 코드 작성 불가
doIt1 {
//    let str = try String(contentsOf: url)
//    print("str from url:", str)
}


//
// 에러가 발생하는 클로저를 파라미터로 하기
func doIt2(_ handler: () throws -> Void) {
    do {
        try handler()
    }
    catch {
        print("Error")
    }
}


doIt2 {
    let str = try String(contentsOf: url)
    print("str from url:", str)
}

//
// 에러가 발생하는 클로저를 파라미터로 하기
func doIt3(_ handler: () throws -> Void) rethrows {
    try handler()
}

do {
    try doIt3 {
        let str = try String(contentsOf: url)
        print("str from url:", str)
    }
}
catch {
    print("Error")
}


//
// 에러가 발생하는 함수를 반환하는 경우
func doIt4() -> () throws -> Void {
    return {
        let str = try String(contentsOf: url)
        print("str from url:", str)
    }
}

let fn = doIt4()
try? fn()
