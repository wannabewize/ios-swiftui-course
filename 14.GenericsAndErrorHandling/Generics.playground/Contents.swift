/**
 * 제네릭
 */

//
// 제네릭 기반으로 동작하는 콜렉션
var array1 = Array<Int>()
array1.append(1)
array1.append(2)

var array2 = Array<String>()
array2.append("a")
array2.append("b")

var dictionary = Dictionary<String, Int>()
dictionary["one"] = 1
dictionary.updateValue(2, forKey: "two")


//
// 함수에 제네릭 적용하기
func printValue<T>(_ v: T) {
    print("value \(v)")
}

printValue(1)
printValue("1")
printValue(1.0)

//
// 프로토콜을 이용한 제네릭의 타입 제약
protocol HavingValueProperty {
    var value: Int { get }
}

func isZero<T: HavingValueProperty>(arg: T) -> Bool {
    return arg.value == 0
}

struct ValueStruct: HavingValueProperty {
    var value: Int
}

class ValueClass: HavingValueProperty {
    var value: Int
    init(value: Int) {
        self.value = value
    }
}

let value1 = ValueStruct(value: 0)
print("value1 is zero?", isZero(arg: value1))
let value2 = ValueClass(value: 1)
print("value2 is zero?", isZero(arg: value2))

//
// 제네릭을 이용한 타입 정의

struct Hospital<T> {
    func hospitalize(_ patient: T) {
        print("병원에 입원")
    }
}

struct Human {
    var name: String
}

enum Pet {
    case dog
    case cat
}

let hospital = Hospital<Human>()
hospital.hospitalize( Human(name: "아픈사람"))

let animalClinic = Hospital<Pet>()
animalClinic.hospitalize(Pet.dog)
animalClinic.hospitalize(Pet.cat)

//
// 제네릭과 프로토타입, associatedtype 으로 명시
protocol MyProtocol<T> {
    associatedtype T
    
    func show(value: T)
}

// 구현시 타입 명시

struct MyStruct: MyProtocol {
    func show(value: String) {
        print("string value is \(value)")
    }
}

// typealias를 이용한 구현
class MyClass: MyProtocol {
    typealias T = Int
    
    func show(value: T) {
        print("Int value is \(value)")
    }
}



