//
//  ContentView.swift
//  GestureHandling
//
//  Created by Jaehoon Lee on 5/23/24.
//

import SwiftUI

struct ContentView: View {
    @State var offset = CGPoint.zero
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { action in
                print("action.location :", action.location)
                self.offset = action.location
            }
        
        VStack {
            Text("Hello, world!")
                .offset(x: offset.x, y: offset.y)
                .gesture(dragGesture)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
