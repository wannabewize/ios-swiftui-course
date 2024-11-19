// 제네릭과 프로토타입, associatedtype 으로 명시
protocol MyProtocol {
    associatedtype T
    
    func show(value: T)
}

// 구현시 타입 명시
struct MyStruct: MyProtocol {
    func show(value: String) {
        print("string value is \(value)")
    }
}

let obj1 = MyStruct()
obj1.show(value: "hello")

// typealias를 이용한 구현
class MyClass: MyProtocol {
    typealias T = Int
    
    func show(value: T) {
        print("Int value is \(value)")
    }
}

let obj2 = MyClass()
obj2.show(value: 100)

print("Done")
