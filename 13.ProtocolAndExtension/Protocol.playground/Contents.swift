/**
 * 프로토콜
 */

// 프로토콜 선언,
protocol Singing {
    // 프로토콜 내 함수. 구현부는 작성 안함
    func sing()
}

//
// 클래스에 프로토콜 채택
class Bird : Singing {
    // 프로토콜에 선언한 함수 정의
    func sing() {
        print("짹짹짹~")
    }
}

// 구조체에 프로토콜 채택
struct Cat : Singing {
    // 프로토콜에 선언한 함수 정의
    func sing() {
        print("갸르릉 갸르릉")
    }
}

// 인스턴스 생성
let sparrow = Bird()
sparrow.sing()

let kitty = Cat()
kitty.sing()



protocol Dancing {
   func dance()
}

// 다수의 프로토콜 채택
struct Human : Dancing, Singing {
   func sing() {
      print("삶이 어떻게 더 완벽해 ooh")
   }
   
   func dance() {
      print("둠칫둠칫")
   }
}

let iu = Human()
iu.sing()
iu.dance()

//
// 프로토콜에 프로퍼티 선언
// 프로퍼티의 set get 설정. get 전용 가능. set 전용 없음.
protocol HoldingBreath {
   var duration : Int { get set }
}

// 저장 프로퍼티로 구현
struct Dolphin : HoldingBreath {
   var duration : Int = 9999
   
}

// 계산 프로퍼티로 구현
class Diver : HoldingBreath {
   var duration : Int {
      get {
         return 300
      }
      set {}
   }
}

let dolphin = Dolphin()
print(dolphin.duration)

let diver = Diver()
print(diver.duration)
