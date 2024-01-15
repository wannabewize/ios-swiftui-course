//
//  ContentView.swift
//  VariousButton
//
//  Created by wannabewize on 1/15/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 24) {
            Button("Simple Button") {
                print("Simple Button Clicked")
            }
            
            Button(action: {
                print("Custom Label Button Clicked")
            }, label: {
                Image(systemName: "car")
                Text("Custom")
                    .foregroundStyle(.black)
                Text("Label")
                Text("Button")
                    .font(.caption)
            })
            
            Button("Button Title", image: ImageResource(name: "tycan", bundle: Bundle.main)) {
                print("Button Clicked")
            }
            
            Button("Destructive Button", role: .destructive) {
                print("Destructive Button Clicked")
            }
            
            Button("Button with systemImage", systemImage: "pencil") {
                print("Button with system Image clicked")
            }
            
            Button("Bordered Button") {
                print("Bordered Button clicked")
            }
            .buttonStyle(.bordered)

            Button("Borderless Button") {
                print("Borderless Button clicked")
            }
            .buttonStyle(.borderless)
            
            Button("BorderedProminent Button") {
                print("BorderedProminent Button clicked")
            }
            .buttonStyle(.borderedProminent)
            
            Button(action: {
                print("aa")
            }, label: {
                HStack {
                    Image(systemName: "car")
                    Text("Button")
                }
                .padding(10)
            })
            .background(.yellow)
            .clipShape(
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                    
                    
            )
        }
    }
}

#Preview {
    ContentView()
}
