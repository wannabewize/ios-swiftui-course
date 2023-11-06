/**
 * 기본 타입 확장하기
 */
import Foundation

extension Int {
    mutating func increse() {
        self += 1
    }
    
    static func random(from: Int, to: Int) -> Int {
        return Int.random(in: from...to)
    }
}

var value = 10
value.increse()
print("value :", value)


// Int의 기본 함수
let basicFuncValue = Int.random(in: 0...10)
// Extension으로 확장한 함수 사용
let extendedFuncValue = Int.random(from: 0, to: 10)

print("Basic Function :", basicFuncValue)
print("Extended Function :", extendedFuncValue)


protocol Sing {
    func sing()
}
extension Sing {
    func sing() {
        print("sing sing sing")
    }
}

extension String: Sing {
}

// 문자열 타입 - Protocol - Extension
let str = "abc"
str.sing()


