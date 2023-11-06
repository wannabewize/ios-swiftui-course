/*
 * 프로토콜과 Initializer
 */

// Initializer
protocol Named {
   // Initializer
   init(name: String)
   
   // Failable Initializer
   init?()
}

//
// 구조체와 프로토콜
struct Hero: Named {
    var name: String
    init?() {
        return nil
    }
    
    init(name: String) {
        self.name = name
    }
}

let hero1 = Hero(name: "용사")

let hero2 = Hero()
print(hero2 == nil)


//
// 클래스와 프로토콜
class Monster: Named {
   let name: String
   // required로 작성
   required init(name: String) {
      self.name = name
   }
   
   // Failable Initializer는 non-Failable Initializer로 구현 가능
   required init() {
      self.name = "Unknown"
   }
}

let monster1 = Monster()
print(monster1 == nil)

let monster2 = Monster(name : "마왕")
print(monster2)



