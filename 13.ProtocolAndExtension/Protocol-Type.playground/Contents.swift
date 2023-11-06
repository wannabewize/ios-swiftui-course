/*
 * 프로토콜 - 타입으로 사용
 */

protocol Singing {
   func sing()
}

struct Human : Singing {
   func sing() {
      print("Sing Sing Sing")
   }
   
   func drink() {
      print("Drink")
   }
}

// 클래스 타입으로 선언한 객체
var singer1 : Human = Human()
// 프로토콜에 선언한 메소드 사용
singer1.sing()
// 프로토콜에 선언하지는 않았지만 클래스에 작성한 메소드
singer1.drink()

// 프로토콜 타입으로 선언한 변수
var singer2 : Singing = Human()
// 프로토콜에 선언한 메소드 사용
singer2.sing()
// 프로토콜에 선언하지는 않았지만 클래스에 작성한 메소드 - 에러
//singer2.drink()


//
// 파라미터 타입으로 선언
func sayHello(who : String, and : Singing) {
   print("Hello. 파라미터 타입은 Singing 프로토콜")
}
sayHello(who: "IU", and : singer2)

protocol Dancing {
   func dance()
}

//
// 프로토콜 컴포지션
struct Idol : Singing, Dancing {
   func sing() {
      print("Sing Sing Sing")
   }
   
   func dance() {
      print("Dance Dance")
   }
}

// 두 개 이상의 프로토콜 ( protocol composition )
func entertain(who : Singing & Dancing) {
   print("Singing, Dancing 프로토콜 타입")
}

var exid = Idol()
entertain(who : exid)

//
// 프로퍼티
struct Audition {
    var candidates: [Singing]
    
    mutating func register(singer: Singing) {
        candidates.append(singer)
    }
    
    var winner: Singing {
        return candidates[0]
    }
}

var audition = Audition(candidates: [])
audition.register(singer: singer1)
audition.register(singer: singer2)

print("winner :", audition.winner)


