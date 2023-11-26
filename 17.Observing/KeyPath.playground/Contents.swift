//
// KeyPath

struct MyStruct {
    var numberValue: Int
    var textValue: String
}

var obj = MyStruct(numberValue: 1, textValue: "a")

// Key-path
let numValue1 = obj[keyPath: \MyStruct.numberValue]
// 타입 이름 생략 가능
let textValue1 = obj[keyPath: \.textValue]

print("number :", numValue1, "text :", textValue1)

obj.numberValue = 2
obj.textValue = "b"

let numValue2 = obj[keyPath: \MyStruct.numberValue]
let textValue2 = obj[keyPath: \.textValue]


print("number :", numValue2, "text :", textValue2)

//
// 복합 타입
struct InnerStruct {
    var value: Int
}
struct OuterStruct {
    var inner: InnerStruct
}

var complexObj = OuterStruct(inner: InnerStruct(value: 10))
let innerValue1 = complexObj[keyPath: \OuterStruct.inner.value]
// 타입 이름 생략
let innerValue2 = complexObj[keyPath: \.inner.value]

print("innerValue :", innerValue1, innerValue2)


//
// KeyPath 타입

// Int 타입의 InnerStruct의 프로퍼티
let path1: KeyPath<OuterStruct, Int> = \OuterStruct.inner.value
// InnerStruct 타입의 inner 프로퍼티
let path2: KeyPath<OuterStruct, InnerStruct> = \.inner

let innerValue = complexObj[keyPath: path1]
let innerStruct = complexObj[keyPath: path2]
print("innerValue :", innerValue, innerStruct.value)


