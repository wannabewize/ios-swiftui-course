/**
 *
 */

// Foundation 프레임워크 필요(String -> Data)
import Foundation


let jsonStr = """
{
    "name": "Swift",
    "version": 5.9,
    "url": "https://swift.org",
    "openSource": true
}
"""


struct LanguageInfo: Codable {
    let name: String
    let version: Double
    let url: String
    let openSource: Bool
}

do {
    if let jsonData = jsonStr.data(using: .utf8) {
        let info = try JSONDecoder().decode(LanguageInfo.self, from: jsonData)
        print("name :", info.name)
        
    }
}
catch {
    print("JSON Decode Error", error.localizedDescription)
}


// Codable -> JSON

let python = LanguageInfo(
    name: "Python",
    version: 3.12,
    url: "https://python.org",
    openSource: true
)

do {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    let encoded = try encoder.encode(python)
    if let stringfy = String(data: encoded, encoding: .utf8) {
        print(stringfy)
    }
    else {
        print("JSON Data -> String fail")
    }
}
catch {
    print("JSON Encode Error", error.localizedDescription)
}

