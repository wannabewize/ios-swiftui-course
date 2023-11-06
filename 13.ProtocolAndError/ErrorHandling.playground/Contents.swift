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
    print(error.localizedDescription)
}

//
// try? 를 이용한 에러 처리. 에러 발생 시 nil
let str2 = try? String(contentsOf: url)
print("str2 :", str2)

//
if let str3 = try? String(contentsOf: url) {
    print("str3 :", str3)
}
else {
    print("Error with if-let binding. nil")
}


// Crash
//let str3 = try! String(contentsOf: url)
              
