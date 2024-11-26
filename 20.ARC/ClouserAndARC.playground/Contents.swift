class MyClass {
    let title: String
    
    init(title: String) {
        self.title = title
    }
        
    func hello() -> (String) -> String {
        return {
            (who: String) in
            "Hello \(who). I am \(self.title)."
        }
    }
    
    func hello2() -> (String) -> String {
        return {
            [unowned self]
            (who: String)
            in
            "Hello \(who). I am \(self.title)."
        }
    }
    
    func hello3() -> (String) -> String {
        return {
            [weak self]
            (who: String)
            in
            "Hello \(who). I am \(self?.title)."
        }
    }
    
    deinit {
        print("\(title) - deinitialized")
    }
}

var obj1: MyClass? = MyClass(title: "Example1")
let fn = obj1?.hello()
obj1 = nil


var obj2: MyClass? = MyClass(title: "Example2")
let fn2 = obj2?.hello2()
print(fn2?("closure"))
obj2 = nil
// Crash
//print(fn2?("closure"))

var obj3: MyClass? = MyClass(title: "Example3")
let fn3 = obj3?.hello3()
print(fn3?("closure"))
obj3 = nil
// Crash
print(fn3?("closure")) // crash 안됨. 자동 nil 변환
