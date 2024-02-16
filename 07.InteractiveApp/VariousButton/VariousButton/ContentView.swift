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
            
            Button("System Image Button", systemImage: "pencil") {
                message = "Button with system Image clicked"
            }
            
            Button("ButtonStyle - bordered") {
                message = "Bordered Style clicked"
            }
            .buttonStyle(.bordered)
            
            Button("ButtonStyle - borderless") {
                message = "Borderless Button clicked"
            }
            .buttonStyle(.borderless)
            
            Button("ButtonStyle - borderedProminent") {
                message = "BorderedProminent Button clicked"
            }
            .buttonStyle(.borderedProminent)
            
            Button(action: {
                message = "Rounded background Button"
            }, label: {
                Text("Rounded background Button clicked")

            })
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1.0)
                    .fill(Color.gray)
            )
            
            Button(action: {
                message = "Overlay Button clicked"
            }, label: {
                Text("Overlay Button")
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
            
            Divider()

            Text(message)
        }
    }
}

#Preview {
    ContentView()
}
