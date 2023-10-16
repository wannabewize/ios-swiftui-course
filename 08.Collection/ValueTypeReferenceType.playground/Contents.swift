/**
 * 밸류 타입과 레퍼런스 타입
 */

//
// 콜렉션(Array, Dirtionary)는 밸류 타입

var array1 = [1, 2, 3, 4, 5]
// 복사
var array2 = array1

array1.append(6)

print("array1의 원소 개수", array1.count, "array2의 원소 개수", array2.count)

//
// 구조체는 밸류 타입
struct MyStruct {
    var value: Int
}

var struct1 = MyStruct(value: 10)
// 복사
var struct2 = struct1
struct1.value = 20

print("struct1의 value", struct1.value, "struct2의 value", struct2.value)


//
// 클래스는 레퍼런스 타입
class MyClass {
    var value: Int
    // 클래스는 init이 필요
    init(value: Int) {
        self.value = value
    }
}

var class1 = MyClass(value: 10)
// 레퍼런스 추가
var class2 = class1
class1.value = 20

print("class1의 value", class1.value, "class2의 value", class2.value)


//
// 배열과 구조체 - 밸류 타입과 밸류 타입
var structArray = [
    MyStruct(value: 1),
    MyStruct(value: 2),
    MyStruct(value: 3)
]

// 구조체 대입 - 복사
var structItem = structArray[1]
structItem.value = 20

// 1, 2, 3
print("structArray - 1")
structArray.forEach { item in
    print("Struct - Value :", item.value)
}

// 밸류 타입 내 값 바꾸기
structArray[2].value = 30

// 1, 2, 30
print("structArray - 2")
structArray.forEach { item in
    print("Struct - Value :", item.value)
}


//
// 배열과 클래스 - 밸류 타입과 레퍼런스 타입
var classArray = [
    MyClass(value: 1),
    MyClass(value: 2),
    MyClass(value: 3),
]

// 레퍼런스
var classItem = classArray[1]
classItem.value = 20

// 1, 20, 3
classArray.forEach { item in
    print("Class - Value:", item.value)
}


