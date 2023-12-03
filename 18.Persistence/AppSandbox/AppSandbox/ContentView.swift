//
//  ContentView.swift
//  AppSandbox
//
//  Created by wannabewize on 12/3/23.
//

import SwiftUI

struct ContentView: View {
    @State var bundleText: String = "not loaded"
    @State var customPListFile: String = "not loaded"
    @State var customFieldInInfoPlist : String = "not loaded"
    @State var documentText: String = "not loaded"
    @State var userInput: String = ""
    
    func loadBundleData() {
        if let url = Bundle.main.url(forResource: "Data", withExtension: "json"),
           let str = try? String(contentsOf: url) {
            bundleText = str
        }
        else {
            bundleText = "Error"
        }
    }
    
    func loadBundlePList() {
        if let url = Bundle.main.url(forResource: "Numbers", withExtension: "plist"), let data = try? Data(contentsOf: url) {
            do {
                let ret = try PropertyListDecoder().decode(Dictionary<String, String>.self, from: data)
                print("ret", ret)
                customPListFile = ret.description
            }
            catch {
                print("Error :", error)
            }
        }
            
    }
    
    func loadValueInInfoPlist() {
        if let customValue = Bundle.main.object(forInfoDictionaryKey: "CustomField") as? String {
            customFieldInInfoPlist = customValue
        }
    }
    
    func saveValue() {
        let path = "\(NSHomeDirectory())/Documents/data.txt"
        let data = userInput.data(using: .utf8)
        // overwrite
        let ret = FileManager().createFile(atPath: path, contents: data)
        print("ret :", ret)
        userInput = ""
    }
    
    func loadValue() {
        let path = "\(NSHomeDirectory())/Documents/data.txt"
        if let data = FileManager().contents(atPath: path),
           let text = String(data: data, encoding: .utf8) {
            documentText = text
        }
        else {
            documentText = "Error"
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("App Sandbox")
                .font(.title)
            
            VStack(spacing: 10) {
                Text("Bundle Container")
                    .font(.title2)
                
                Button("번들 JSON 로드") {
                    loadBundleData()
                }
                
                Text(bundleText)
                    .font(.caption)
                    .padding()
                    .border(.gray, width: 0.5)
                
                Button("Info.plist의 커스텀 필드 읽기") {
                    loadValueInInfoPlist()
                }
                
                Text(customFieldInInfoPlist)
                    .font(.caption)
                    .padding()
                    .border(.gray, width: 0.5)
                
                Button("커스텀 plist 파일 로드") {
                    loadBundlePList()
                }
                
                Text(customPListFile)
                    .font(.caption)
                    .padding()
                    .border(.gray, width: 0.5)
            }
            
            VStack(spacing: 10) {
                Text("Data Container")
                    .font(.title2)
                
                HStack {
                    TextField("User Input", text: $userInput)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("저장") {
                        saveValue()
                    }
                }
                .padding(.horizontal, 40)
                
                Button("Data in Documents 읽기") {
                    loadValue()
                }
                
                Text(documentText)
                    .font(.caption)
                    .padding()
                    .border(.gray, width: 0.5)
            }
            
            Spacer()
            
        }
        .padding()
        .onAppear(perform: {
            print("Bundle", Bundle.main.bundlePath)
            
            let jsonPath: String? = Bundle.main.path(forResource: "Data", ofType: "json")
            let jsonUrl: URL? = Bundle.main.url(forResource: "Data", withExtension: "json")
            
            print("json path:", jsonPath)
            print("json url:", jsonUrl)
            
            print("Data Container", NSHomeDirectory())
            
            let documentPath1 = "\(NSHomeDirectory())/Documents"
            
            let documentPath2 = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            
            print("documentPath1 :", documentPath1)
            print("documentPath2 :", documentPath2)
            
        })
    }
}

#Preview {
    ContentView()
}
