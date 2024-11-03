//
//  ContentView.swift
//  DynamicListExample
//
//  Created by wannabewize on 11/4/24.
//

import SwiftUI

struct ContentView: View {
    let textData = ["item a", "item b", "item c", "item d"]
    let numericData = [1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5]

    var body: some View {
        VStack {
            List(textData, id: \.self) { item in
                Text(item)
            }
            List(numericData, id: \.self) { item in
                Text("Item \(item)")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
