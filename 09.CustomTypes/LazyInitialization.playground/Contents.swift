/**
 * Lazy 프로퍼티 초기화
 * 프로퍼티 사용 시점에 초기화
 */

//
// Lazy
struct ValueStruct {
    var value: Int
    init(value: Int) {
        self.value = value
        print("ValueStruct \(value) 인스턴스 생성")
    }
}
struct LazyStruct1 {
    lazy var valueObj = ValueStruct(value: 1)
    init() {
        print("MainStruct 인스턴스 생성")
    }
}

var lazyObj1 = LazyStruct1()
print("LazyStruct1 인스턴스 생성 완료")
print(lazyObj1.valueObj) // ValueStruct 인스턴스 생성


struct LazyStruct2 {
    var valueObj1: ValueStruct = {
        return ValueStruct(value: 2)
    }()
    
    lazy var valueObj: ValueStruct = {
        ValueStruct(value: 3) // return 생략
    }()
}

var lazyObj2 = LazyStruct2()
print("LazyStruct2 인스턴스 생성 완료")
print(lazyObj2.valueObj) // ValueStruct 인스턴스 생성
