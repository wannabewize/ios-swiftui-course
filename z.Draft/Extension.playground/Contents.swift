/*
 * 확장
 */

struct Dog {
    var name: String
    
    func eat() {
        print("먹기")
    }
}

// extension에서 메소드 작성
extension Dog {
    
    func bike() {
        print("멍멍멍")
    }
    
    // 정적 메소드
    static func hasTail() -> Bool {
        return true
    }
}

var doggy = Dog(name: "Jelly")
doggy.eat()
// extension에 있는 메소드 호출
doggy.bike()
// 타입 메소드
print("개는 꼬리가 있다? : ", Dog.hasTail())


// 프로퍼티 - Computed Property만 가능. Stored Property는 불가
extension Dog {
    var desc: String {
        "이름 \(name)"
    }
    
    static var averageLife : Int { return 12 }
}

print(doggy.desc)
print("평균 수명 : \(Dog.averageLife)년")

//
// 프로토콜 채택
//

protocol Running {
    func run()
}

// Extension에서 프로토콜 채택
extension Dog : Running {
    func run() {
        print("뛰기")
    }
}

doggy.run()

//
// Enum extension
//
enum Favorite : Int {
    case movie
    case drive
    case cycle
}

extension Favorite {
    // 타입 계산 프로퍼티
    static var random : Favorite {
        if let r = (0...2).randomElement(),
           let favorite = Favorite(rawValue: r) {
            return favorite
        }
        // default
        return .movie
    }
}

let randomFavorite = Favorite.random
print("Random Favorite : ", randomFavorite)


