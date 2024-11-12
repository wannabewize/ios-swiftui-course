//
//  ContentView.swift
//  EnvironmentExample
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var counter: Counter
    
    var body: some View {
        VStack(spacing: 30) {
            VStack {
                Text("Parent View").font(.headline)
                Text("value : \(counter.value)")
                HStack {
                    Button("+1") {
                        counter.increase()
                    }
                    .buttonStyle(.borderedProminent)                    
                    Button("+1(async)") {
                        counter.increaseAsync()
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            
            Divider()
            
            EnvironmentObjectView()
            
            Divider()
            
            ObservedObjectView(counter: counter)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(Counter())
}
