//
//  ContentView.swift
//  SwiftDataExercise
//
//  Created by wannabewize on 12/2/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var items: [Item]
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("Count \(items.count)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
