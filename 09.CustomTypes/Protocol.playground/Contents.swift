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

enum MusicGenre: String, Singing {
    case pop = "Pop"
    case rock = "Rock"
    case hiphop = "Hiphop"
    
    func sing() {
        print("sing \(self.rawValue)")
    }
}

let sparrow = Bird()
sparrow.sing()

let kitty = Cat()
kitty.sing()

let pop = MusicGenre.pop
pop.sing()

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

func entertain(who : Singing & Dancing) {
}


/*
 * 프로토콜과 프로퍼티
 */

// 프로퍼티의 get/set 설정
protocol HoldingBreath {
   var duration : Int { get set }
}

protocol Runnable {
   var speed: Int { get }
}

// 저장 프로퍼티로 구현과 사용
class Dolphin : HoldingBreath {
   var duration : Int = 9999
}

let dolphin = Dolphin()
print(dolphin.duration)

struct Cheetah: Runnable {
    let name: String
    var energy: Int
    var avgSpeed: Int
    
    var speed: Int {
        avgSpeed + energy
    }
}

// 정적 메소드와 프로퍼티
protocol Species {
   // 정적 메소드
   static func species() -> String
   // 정적 프로퍼티
   static var averageLife : Int { get }
}

class Cow: Species {
  // 타입 메소드 구현
   static func species() -> String {
      return "소"
   }
   static var averageLife : Int {
      return 10
   }
}

print("소 : \(Cow.averageLife), \(Cow.species())")

protocol Named {
   init(name : String)
}

class NamedMonster : Named {
   let name : String
   required init(name: String) {
      self.name = name
   }
}

//
// Failable Initializer
protocol Monster {
    init?(power: Int)
}

struct Ghost: Monster {
    var power: Int
    init?(power: Int) {
        if power < 0 {
            return nil
        }
        self.power = power
    }
}

class Gagoil: Monster {
    var power: Int
    required init(power: Int) {
        // can not return nil
        self.power = power > 0 ? power : 0
    }
}





