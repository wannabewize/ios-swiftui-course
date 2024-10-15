//
//  ContentView.swift
//  TextData
//
//  Created by wannabewize on 10/16/24.
//

import SwiftUI

struct ContentView: View {
    @State var secureStr = ""
    @State var textInput = ""
    @State var textEditorStr = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .padding(10)
                .border(.gray)
            
            TextField("TextField", text: $textInput)
                .padding(20)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(lineWidth: 0.5)
                }
            SecureField("Secure", text: $secureStr)
                .padding(10)
                .border(.black, width: 0.75)
            TextEditor(text: $textEditorStr) // iOS 18
                .border(.gray, width: 0.75)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
