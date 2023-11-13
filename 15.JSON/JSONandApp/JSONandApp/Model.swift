//
//  Model.swift
//  JSONandApp
//
//  Created by wannabewize on 11/13/23.
//

import Foundation

struct LanguageInfo: Codable {
    let name: String
    let image: String
    let isOpenSource: Bool
    let release: Int
    let lastVersion: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case image = "logo"
        case isOpenSource = "open_source"
        case release = "release_year"
        case lastVersion = "latest_version"
    }
}

struct LanguageWrapper: Codable {
    let languages: [LanguageInfo]
}

func fetchData() -> [LanguageInfo]? {
    if let url = Bundle.main.url(forResource: "data", withExtension: "json"),
       let data = try? Data(contentsOf: url) {
        
        do {
            let ret = try JSONDecoder().decode(LanguageWrapper.self, from: data)
            print("ret :", ret)
            return ret.languages
        }
        catch {
            print("something wrong", error)
            return nil
        }
    }
    else {
        print("url, data problem")
        return nil
    }
    
}
