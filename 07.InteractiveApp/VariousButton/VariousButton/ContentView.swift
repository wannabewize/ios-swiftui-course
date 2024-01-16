//
//  ContentView.swift
//  VariousButton
//
//  Created by wannabewize on 1/15/24.
//

import SwiftUI

struct ContentView: View {
    @State var message: String = ""
    
    var body: some View {
        VStack(spacing: 24) {
            Button("Simple Button") {
                message = "Simple Button Clicked"
            }
            
            Button(action: {
                message = "Custom Label Button Clicked"
            }, label: {
                Image(systemName: "car")
                Text("Custom")
                    .foregroundStyle(.black)
                Text("Label")
                Text("Button")
                    .font(.caption)
            })
            
            Button("Image Resource Button Title", image: ImageResource(name: "tycan", bundle: Bundle.main)) {
                message = "Button Clicked"
            }
            
            Button("Destructive Button", role: .destructive) {
                message = "Destructive Button Clicked"
            }
            
            Button("Button with systemImage", systemImage: "pencil") {
                message = "Button with system Image clicked"
            }
            
            Button("Bordered Button") {
                message = "Bordered Style Button clicked"
            }
            .buttonStyle(.bordered)
            
            Button("Borderless Button") {
                message = "Borderless Style Button clicked"
            }
            .buttonStyle(.borderless)
            
            Button("BorderedProminent Button") {
                message = "BorderedProminent Style Button clicked"
            }
            .buttonStyle(.borderedProminent)
            
            Button(action: {
                message = "Round button"
            }, label: {
                Text("Rounded Border Button")
            })
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.red, lineWidth: 2.0)
            )
            .background(.yellow)
            .cornerRadius(10)
            .tint(.white)
            
            Text("Text with Gesture")
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1.0)
                        .fill(Color.gray)
                )
                .onTapGesture {
                    message = "Text with Gesture Clicked"
                }

            Text(message)
        }
    }
}

#Preview {
    ContentView()
}
