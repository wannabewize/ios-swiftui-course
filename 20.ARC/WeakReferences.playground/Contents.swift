class Person {
    let name: String
    init(name: String) {
        self.name = name
    }
    
    var apartment: Apartment?
    deinit {
        print("\(name) is being deinitialized")
    }
}


class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    
    weak var tenant: Person?
    
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

var rose: Person? = Person(name: "ROSE")
var apt: Apartment? = Apartment(unit: "APT")

rose?.apartment = apt
apt?.tenant = rose

rose = nil
print("tenent of apt :", apt?.tenant) // 참조된 객체가 해제되면 자동으로 nil

print("Done")


