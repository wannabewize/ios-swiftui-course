import Foundation

let jsonStr1 = """
{
    "data" : {
        "intValue": 10
    }
}
"""

let jsonStr2 = """
{
    "data" : {
        "stringValue": "10"
    }
}
"""

struct IntValueInfo: Codable {
    let value: Int
    
    enum CodingKeys: String, CodingKey {
        case value = "intValue"
    }
}

struct StringValueInfo: Codable {
    let stringValue: String
}

struct DataWrapper<T: Codable>: Codable {
    let data: T
}


let decoder = JSONDecoder()


if let data = jsonStr1.data(using: .utf8),
   let decoded = try? decoder.decode( DataWrapper<IntValueInfo>.self, from: data) {
    print("JSON-1 :", decoded.data.value)
}
    

if let data = jsonStr2.data(using: .utf8),
   let decoded = try? decoder.decode(DataWrapper<StringValueInfo>.self, from: data) {
    print("JSON-2 :", decoded.data.stringValue)
}
