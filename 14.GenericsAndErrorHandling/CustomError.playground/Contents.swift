/**
 * 커스텀 에러 정의하기
 */
import Foundation

//
// Enum 으로 에러 정의하기
enum InputError : Error {
    case notPositive
}

// 에러 발생시키기
do {
    throw InputError.notPositive
}
catch {
    print("InputError.notPositive!")
}

// 에러가 발생할 수 있는 함수
func inputOnlyPositive(_ value: Int) throws {
    guard value > 0 else {
        throw InputError.notPositive
    }
    print("OK")
}

enum NotZeroError : Error {
    case below(String, Int)
    case over(String)
}

// 에러가 발생하는 함수
func inputZero(_ val : Int) throws {
    if val > 0 {
        throw NotZeroError.over("over zero")
    }
    else if val < 0 {
        throw NotZeroError.below("below zero", val)
    }
   
    print("It's OK.", val)
}

//
// 사용하기
do {
    try inputZero(-1)
}
// error 바인딩 생략 가능. error 이름 사용
catch {
    print("Error", error)
}

do {
    try inputZero(2)
}
catch let NotZeroError.over(msg) {
    print("error :", msg)
}
catch let NotZeroError.below(msg, value) {
    print("error :", msg, "value :", value)
}


//
// 구조체나 클래스를 이용한 에러 정의
struct StructError: Error {
    let code: Int
    let message: String
}

class ClassError: Error {
    
}

do {
    throw StructError(code: 100, message: "Error")
}
catch let error as StructError {
    print("Struct Error: ", error.code)
}
catch {
    print("Other error")
}

