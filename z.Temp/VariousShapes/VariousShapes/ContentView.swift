//
//  ContentView.swift
//  VariousShapes
//
//  Created by wannabewize on 1/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Circle by Clip")
                .frame(width: 100, height: 100)
                .background(.blue)
                .clipShape(Circle())
                .foregroundStyle(.white)

            Text("Rounded Rectange")
                .frame(width: 100, height: 100)
                .background(.blue)
                .clipShape(
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 10), style: .continuous), style: FillStyle())
            
            Text("Border")
                .frame(width: 100, height: 100)
                .background(.blue)
                .border(Color.black, width: 3)
            
            Text("Rounded Shape")
                .frame(width: 100, height: 100)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                )
            
            Text("Rounded Border")
                .frame(width: 100, height: 100)
                .background(.blue)
                .clipShape(
                    RoundedRectangle(cornerRadius: 10)
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1.0)
                }
            
            Text("Hidden")
                .frame(width: 100, height: 100)
                .background(.blue)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.yellow)
                        .padding(5)
                }
                .overlay {
                    Circle()
                        .fill(.red)
                        .padding(10)
                }
                .overlay {
                    Text("Overlays")
                        .font(.headline)
                }
            
            
            
            Text("Shadow")
                .frame(width: 100, height: 100)
                .background(.blue)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            

            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
