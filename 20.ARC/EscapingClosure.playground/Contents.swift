import Foundation

class MyClass {
    
    var capturing: (() -> Void)?
    
    func doIt( arg: () -> Void ) {
        arg()
    }
        
    func doIt2( arg: @escaping () -> Void ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            arg()
        }
    }
    
    func doIt3( arg: @escaping () -> Void ) {
        self.capturing = arg
    }
}


class CallerClass {
    let title: String
    init(title: String) {
        self.title = title
    }
    
    deinit {
        print("\(title) deinitialized")
    }
    
    func sayHello() {
        print("hello")
    }
}

let obj = MyClass()

var caller1: CallerClass? = CallerClass(title: "Example1")
obj.doIt(arg: caller1!.sayHello)

caller1 = nil


var caller2: CallerClass? = CallerClass(title: "Example2")
obj.doIt2(arg: caller2!.sayHello)
caller2 = nil


var caller3: CallerClass? = CallerClass(title: "Example3")
obj.doIt3(arg: caller3!.sayHello)
caller3 = nil



