//
//  ContentView.swift
//  BasicListExamples
//
//  Created by wannabewize on 10/30/24.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        VStack {
            Text("List and Multi-Views").font(.subheadline)
            List {
                Text("Item - 1")
                Text("Item - 2")
                Text("Item - 3")
                Text("Item - 3")
                Text("Item - 4")
            }
            Divider()
            
            Text("List and ForEach").font(.subheadline)
            List {
                ForEach(0..<5) { item in
                    Text("Item - \(item)")
                }
            }
            
            Text("List and Collection/Range").font(.subheadline)
            List(0..<5) { item in
                Text("Item - \(item)")
            }

            Divider()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
