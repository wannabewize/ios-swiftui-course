/*
 * 프로토콜
 */

// 프로토콜 선언
protocol Singing {
   func sing()
}

// 클래스 채택
class Bird : Singing {
   func sing() {
      print("짹짹짹~")
   }
}

// 구조체 채택
struct Cat : Singing {
   func sing() {
      print("갸르릉 갸르릉")
   }
}

let sparrow = Bird()
sparrow.sing()

let kitty = Cat()
kitty.sing()


protocol Dancing {
   func dance()
}

// 다수의 프로토콜 채택
class Human : Dancing, Singing {
   func sing() {
      print("랄라라~")
   }
   
   func dance() {
      print("춤추기")
   }
}

let iu = Human()
iu.sing()
iu.dance()

/*
 * 프로토콜과 프로퍼티
 */

// 프로퍼티의 get/set 설정
protocol HoldingBreath {
   var duration : Int { get set }
}

protocol Animal {
   var legs : Int { get }
}

// 저장 프로퍼티로 구현과 사용
class Dolphin : HoldingBreath {
   var duration : Int = 9999
}

let dolphin = Dolphin()
print(dolphin.duration)

struct Mammal: Animal {
    let name: String
    var legs: Int {
        return 4
    }
}



