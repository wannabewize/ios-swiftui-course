class Car {
    let name: String
    var engine: Engine?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("Car \(name) deinitialized")
    }
}

class Engine {
    let name: String
    var car: Car?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("Engine \(name) deinitialized")
    }
}

var car1: Car? = Car(name: "car1")
var engine1: Engine? = Engine(name: "engine1")

car1?.engine = engine1
engine1?.car = car1

car1 = nil
engine1 = nil

print("car1, engine1 nil")


var car2: Car? = Car(name: "car2")
var engine2: Engine? = Engine(name: "engine2")

car2?.engine = engine2
engine2?.car = car2

car2?.engine = nil
engine2?.car = nil

car2 = nil
engine2 = nil

print("car2, engine2 nil")

