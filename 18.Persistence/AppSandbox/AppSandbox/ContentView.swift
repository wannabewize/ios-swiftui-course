//
//  ContentView.swift
//  AppSandbox
//
//  Created by wannabewize on 12/3/23.
//

import SwiftUI

struct ContentView: View {
    @State var bundleText: String = "not loaded"
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
        VStack(spacing: 40) {
            Text("App Sandbox")
                .font(.title)
            
            VStack(spacing: 20) {
                Text("Bundle Container")
                    .font(.title2)
                
                Button("번들 데이터 로드") {
                    loadBundleData()
                }
                
                Text(bundleText)
                    .padding()
                    .border(.gray, width: 0.5)
            }
            
            VStack(spacing: 20) {
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
