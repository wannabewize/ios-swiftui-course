/*
 * 프로토콜 extension
 * POP : Protocol Oriented Programming
 */

protocol Movable {
}

// 프로토콜 확장 – 구현 작성 가능
extension Movable {
   func move() {
      print("Go! go! go!")
   }
}


// Movable 프로토콜을 채택한 구조체
struct Human : Movable {
}

var man = Human()
man.move() // 기본 구현처럼 동작


protocol Flyable {
}

extension Flyable {
   func fly() {
      print("Fly me to the moon")
   }
}

// 다중 프로토콜 채택
struct Superman : Movable, Flyable {
   // 프로토콜 구현을 재정의
   func move() {
      print("Move Fast")
   }
}

var superman = Superman()
superman.move()
superman.fly()
