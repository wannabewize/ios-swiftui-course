/*
 * class 정의와 객체 생성
 */

enum Size: String {
    case tall = "톨"
    case grande = "그란데"
    case venti = "벤티"
}

class Coffee {
    // name, size 프로퍼티는 Non-Optional, 초기값이 없는 프로퍼티 -> init 필요
    var name : String
    var size : Size
    
    init(name: String, size: Size) {
        // init 에서 초기화가 필요한 모든 프로퍼티 초기화하기
        self.name = name
        self.size = size
    }
    
    func sizeUp() {
        switch size {
        case .tall:
            size = .grande
        case .grande:
            size = .venti
        case .venti:
            size = .venti
        }
    }
}

let americano = Coffee(name: "아메리카노", size: .tall)
print("\(americano.name) 사이즈 : \(americano.size.rawValue)")

americano.sizeUp()
print("\(americano.name) 사이즈 업 : \(americano.size.rawValue)")
