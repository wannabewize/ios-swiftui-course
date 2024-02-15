/**
 Enum으로 커스텀 타입 정의하기
 */
enum Day {
    case am
    case pm
}

// 타입 표기, 초기화
var now : Day
now = Day.am

// switch-case와 enum
switch now {
case .am:
    print("오전")
case .pm:
    print("오후")
}

//
// Iteration
enum Season: String, CaseIterable {
    case spring = "봄"
    case summer = "여름"
    case autumn = "가을"
    case winter = "겨울"
}

let march = Season.spring
let december: Season = .winter

// CaseIterable와 allCases
let seasons: [Season] = Season.allCases
for item in Season.allCases {
    print(item.rawValue)
}

//
// Raw Value
//  - 개별 원소에 값 대입하기
//  - 정수형의 경우, 추측 가능하면 값 입력 생략 가능
enum Pet : Int {
    case cat = 0
    case dog
    case other
}

// rawValue에서 enum얻기 - Optional Type
var ael: Pet? = Pet(rawValue: 0)
print(ael!)

// enum에서 rawValue 얻기 - Non-Optional Type
let raz: Pet = Pet.cat
let razRawValue: Int = raz.rawValue
print("Pet.cat : rawValue : ", razRawValue) // 고양이

// 문자열 값 대입하는 경우 - 생략 불가
enum Device: String {
    case phone = "휴대폰"
    case pad = "패드"
}

let iPhone = Device.phone
print("iPhone은 \(iPhone.rawValue)")

//
// Associated Value
enum ArrivalStatus {
    case onTime
    case delay(Int)
}

var flightStatus = ArrivalStatus.onTime
flightStatus = .delay(1)

switch flightStatus {
case .onTime:
    print("제때 도착")
case .delay(let hour):
    print("지연 시간 \(hour)")
}

//
// Property and Enum
enum Direction: Int {
    case east = 0, west, north, south
    
    // computed property만 가능
    var name: String {
        switch self {
        case .east: return "동"
        case .west: return "서"
        case .south: return "남"
        case .north: return "북"
        }
    }
    
    // Function and Enum
    func clockwise() -> Direction {
        switch self {
        case .east:
            return .south
        case .west:
            return .north
        case .north:
            return .east
        case .south:
            return .west
        }
    }
}

// 프로퍼티 사용하기
let direction = Direction.east
print(direction.name)

// 함수 사용하기
print("closewise of \(direction.name) is \(direction.clockwise().name)")



