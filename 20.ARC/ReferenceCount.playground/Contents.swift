import UIKit

class MyClass {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) deinitialized")
    }
}

var obj: MyClass? = MyClass(name: "obj")
obj = nil  //deinit works

var obj1: MyClass? = MyClass(name: "obj1")
var obj2 = obj1
obj1 = nil

print("Done")

func doIt() {
    var obj3 = MyClass(name: "obj2")
}

doIt()


var obj4: MyClass?

@MainActor func doIt2() {
    obj4 = MyClass(name: "obj4")
}

doIt2()



