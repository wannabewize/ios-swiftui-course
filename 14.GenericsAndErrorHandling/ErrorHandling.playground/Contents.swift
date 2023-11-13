/**
 * 에러가 발생하는 함수 사용하기
 * 함수 : String(contentOf: URL) throws
 * Foundation 프레임워크 필요
 */

import Foundation


let url = URL(string: "http://server.address/not.exist")!
print("url instance created", url)

// do-catch 를 이용한 에러 처리. 에러 발생 시 catch 실행
do {
    let str1 = try String(contentsOf: url)
    print("str from url:", str1)
}
catch let error {
    // 에러 메시지 출력
    print(error.localizedDescription)
}

//
// try? 를 이용한 에러 처리. 에러 발생 시 nil
let str2 = try? String(contentsOf: url)
print("str2 :", str2)

// try? - if-let binding
if let str3 = try? String(contentsOf: url) {
    print("str3 :", str3)
}
else {
    print("Error with if-let binding. nil")
}


// Forced Unwrapping - Crash
//let str3 = try! String(contentsOf: url)


// 에러가 발생해도 비정상 종료되지 않고 계속 동작함.
print("== DONE ==")


