/**
 * 커스텀 에러 정의하기
 */
import Foundation

enum CustomError : Error {
    case myFault
    case yourFault
}


// 에러가 발생하는 함수
func inputPositive(_ val : Int) throws {
    guard val > 0 else {
        throw CustomError.yourFault
    }
   
    print("It's OK.", val)
}

//
// 사용하기
do {
    try inputPositive(-1)
}
// error 바인딩 생략 가능. error 이름 사용
catch {
    print("Error", error)
}

try? inputPositive(-2)
