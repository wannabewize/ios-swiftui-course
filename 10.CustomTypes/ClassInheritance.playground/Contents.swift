/**
 * 클래스 상속 예제
 */

// 부모 클래스 정의
class Shape {
    // 부모 클래스의 stored property
    var edge: Int
    
    // 부모 클래스의 initializer
    init(edge: Int) {
        self.edge = edge
    }
    
    func showHowManyEdge() {
        print("It has \(edge) edges")
    }
    
    func size() -> Float {
        return 0
    }
}

// 클래스 상속
class Rectangle: Shape {
    // 자식 클래스의 stored property
    var width: Int
    var height: Int
    
    // initializer
    init(width: Int, height: Int) {
        // 자식 클래스 초기화
        self.width = width
        self.height = height
        // 자식 클래스 초기화 이후 부모 클래스 초기화
        super.init(edge: 4)
    }
    
    // 부모 클래스의 메소드 재정의
    override func size() -> Float {
        return Float(width * height)
    }
}


let rectangle = Rectangle(width: 10, height: 20)
print("rectangle has \(rectangle.edge) edges")
print("rectangle width: \(rectangle.width) \(rectangle.height)")
// 부모 클래스에서 상속받은 함수 사용
rectangle.showHowManyEdge()
// 자식 클래스에서 재정의한 함수 사용
print("rectangle size : \(rectangle.size())")


