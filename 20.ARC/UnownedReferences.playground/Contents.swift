class Customer {
    let name: String
    var card: CreditCard?
    
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}


class CreditCard {
    let title: String
    unowned let customer: Customer! // Optional 가능??? 예전엔 안됐음.
    
    init(title: String, customer: Customer) {
        self.title = title
        self.customer = customer
    }
    
    deinit {
        print("Card \(title) is being deinitialized")
    }
}

var rose: Customer? = Customer(name: "ROSE")
let card: CreditCard? = CreditCard(title: "MY APT Card", customer: rose!)

rose = nil

print("DONE")

print("credit card :", card)


