/**
 * 초기화
 */

// 변수/상수 초기화, 선언과 초기화 분리
var value1 = 100
var value2: Int
value2 = 200

// 조건을 이용한 초기화
let value3: String
if value1 >= 100 {
    value3 = "<100"
}
else {
    value3 = ">= 100"
}

//
// 커스텀 타입 초기화

struct MYStruct1 {
    var value: Int
}

// 프로퍼티 자동 초기화 메소드 생성
let obj1 = MYStruct1(value: 10)

// 옵셔널 타입의 프로퍼티인 경우 - 인스턴스 생성 방법
struct MyStruct2 {
    var value1: Int
    var value2: Int?
}

let obj2 = MyStruct2(value1: 11)
let obj3 = MyStruct2(value1: 12, value2: 13)

// 수동 초기화

struct MyStruct3 {
    var value1: Int
    var value2: Int
    
    init() {
        value1 = 0
        value2 = 0
    }
}

let obj4 = MyStruct3()
//let obj5 = MyStruct3(value1: 10, value2: 20)

// 다수의 초기화 메소드
struct MyStruct4 {
    var value1: Int
    var value2: Int
    
    // designated initializer
    init(value1: Int, value2: Int) {
        self.value1 = value1
        self.value2 = value2
    }
    
    // convenience Initializer
    init() {
        self.init(value1: 0, value2: 0)
    }
    
    // convenience Initializer
    init(value1: Int) {
        self.init(value1: value1, value2: 0)
    }
}

let obj6 = MyStruct4(value1: 10)

//
// 클래스 초기화. 수동 init 필요
class MyClass1 {
    var value1: Int
    var value2: Int
    
    // designated initializer
    init(value1: Int, value2: Int) {
        self.value1 = value1
        self.value2 = value2
    }
    
    convenience init() {
        self.init(value1: 0, value2: 0)
    }
    
    convenience init(value1: Int) {
        self.init(value1: value1, value2: 0)
    }
}

let obj7 = MyClass1()
let obj8 = MyClass1(value1: 1, value2: 2)
print("obj7", obj7)
print("obj8", obj8)

//
// Complex
enum FuelType {
    case electric
    case petrol
    case hybrid
}

struct Size {
    let height: Int
    let width: Int
    let length: Int
}

struct Vehicle {
    let name: String
    let brand: String
    let fuelType: FuelType
    let size: Size
}

let boxster = Vehicle(name: "718 Boxster", brand: "Porsche",
                      fuelType: .petrol,
                      size: Size(height: 1275, width: 1800, length: 4390))
print("vehicle", boxster)


class Person {
   var value : Int
   
   // Failable Initializer
   init?(value : Int) {
      if value <= 0 {
         return nil
      }
      self.value = value
   }
}

let person: Person? = Person(value: 999)

