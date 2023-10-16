/**
 * Closure Expression
 */

let originArray = [1, 3, 4, 2, 5]

let sorted1 = originArray.sorted()
print("sorted1 :", sorted1)

// sorted 함수 시그니처 : originArray.sorted(by: (Int, Int) throws -> Bool)
// 같은 함수 타입의 함수 정의 후 입력하기
func sortFn1(lhs: Int, rhs: Int) -> Bool {
    return lhs < rhs
}
let sorted2 = originArray.sorted(by: sortFn1)
print("sorted2 :", sorted2)


// Closure Expression 으로 함수(sortFn1) 별도 변환 후 사용하기
let sortFn2 = { (lhs: Int, rhs: Int) -> Bool in
    return lhs < rhs
}
let sorted3 = originArray.sorted(by: sortFn2)
print("sorted3 :", sorted3)


// Closure Expression을 직접 대입하기
let sorted4 = originArray.sorted(by: { (lhs: Int, rhs: Int) -> Bool in
    return lhs < rhs
})
print("sorted4 :", sorted4)

// Closure Expression 에서 파라미터와 반환 타입 선언 생략
// 바디가 return 구문 1개이므로 return 생략 가능
let sorted5 = originArray.sorted(by: { lhs, rhs in
    lhs < rhs
})
print("sorted5 :", sorted5)


// Trailing Closure. 함수 타입의 파라미터가 뒤쪽인 경우(non-함수 타입 파라미터가 이후로 더 없으면) 괄호 밖으로
// Trailing Closure 적용 후 함수 호출식의 () 안에 파라미터가 없으면 () 생략
let sorted6 = originArray.sorted { lhs, rhs in
    lhs < rhs
}
print("sorted6 :", sorted6)

// 파라미터 정의 생략. 순서대로 $0, $1, $2... 사용
let sorted7 = originArray.sorted {
    $0 < $1
}
print("sorted7 :", sorted7)

// 연산자도 일종의 함수. Int 타입의 < 연산자 함수의 함수 타입은 (Int, Int) -> Bool
// Trailing closure 해당 안됨
// 참고 : https://docs.swift.org/swift-book/documentation/the-swift-programming-language/advancedoperators#Custom-Operators
let sorted8 = originArray.sorted(by: <)
print("sorted8 :", sorted8)

