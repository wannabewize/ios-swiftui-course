import Foundation

let jsonStr = """
{
    "models": [
        {
            "name": "iPhone15",
            "chip": "A16 Bionic",
            "weight": "171g",
            "display": "15.5cm OLED",
            "resolution": "2556 * 1179",
        },
        {
            "name": "iPhone15 Pro",
            "chip": "A17 Pro",
            "weight": "187g",
            "display": "15.5cm OLED",
            "resolution": null,
        }
    ]
}
"""

struct PhoneModel: Codable {
    let name: String
    let cpu: String
    let weight: String
    let resolution: String? // JSON 프로퍼티의 값이 없는 경우(null) 혹은 프로퍼티 생략
    
    
    enum CodingKeys: String, CodingKey {
        case name
        case cpu = "chip" // JSON 프로퍼티와 Codable 구조체 프로퍼티 이름이 다른 경우
        case weight
        case resolution
    }
}

struct ModelWrapper: Codable {
    let models: [PhoneModel]
}

let decoder = JSONDecoder()
if let data = jsonStr.data(using: .utf8),
   let ret = try? decoder.decode(ModelWrapper.self, from: data) {
    print("ret :", ret)
    
    let iPhone15 = ret.models[0]
    print("iPhone15 cpu:", iPhone15.cpu)
    
    let iPhone15Pro = ret.models[1]
    print("iPhone15 resolution", iPhone15Pro.resolution)
}

