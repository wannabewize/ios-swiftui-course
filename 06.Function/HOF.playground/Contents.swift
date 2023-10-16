/**
 * High Order Function
 * For Loop 와 map, filter, reduce
 */

let originArray = [1,4,2,6,7,3,5,8,9]

/*
 * 각 원소의 값을 2배한 배열 얻기
 */

// For 구문 사용시 결과값을 위한 빈 배열이 필요. For 외부의 값(twiceArray1)에 영향을 준다.
var twiceArray1: [Int] = []

for item in originArray {
    twiceArray1.append( item * 2)
}
print("TWICE RET :", twiceArray1)


// map을 사용하는 코드. map 내부의 코드가 외부에 영향을 미치지 않는다.

let twiceArray2 = originArray.map { item in
    item * 2
}
print("TWICE RET2 :", twiceArray2)


/*
 * Pipeline 만들기
 */

// 배열의 원소 중 값이 홀수만 문자열로 변환하기
// For로 작성하는 경우, 기존 코드(홀수 고르기)를 수정!해야 하지만 HOF를 사용하는 경우, 기존 코드를 수정할 필요가 없다.

var oddStringArray1: [String] = []

for item in originArray {
    if item % 2 != 0 {
        oddStringArray1.append("\(item)")
    }
}
print("Odd String array1 :", oddStringArray1)

// filter와 map으로 구현

let oddStringArray2 = originArray.filter { item in
    item % 2 != 0
}.map { item in
    "\(item)"
}

print("Odd String array2 :", oddStringArray2)


// 1개의 값으로 수렴하는 코드

// 배열의 합 구하기
var sum1 = 0

for item in originArray {
    sum1 += item
}
print("sum1 :", sum1)

// reduce를 이용해서 합 구하기
// originArray.reduce(initialResult: <ResultType>, nextPartialResult: (<ResultType, Int>) -> <ResultType>)
// ResultType은 Int
let sum2 = originArray.reduce(0) { partialResult, item in
    partialResult + item
}
print("sum2 :", sum2)


// originArray 원소 중 홀수의 각 원소 2배 값의 합

let result2 = originArray.filter { item in
    item % 2 != 0
}.map { item in
    item * 2
}.reduce(0) { partialResult, item in
    partialResult + item
}

print("result2 :", result2)


