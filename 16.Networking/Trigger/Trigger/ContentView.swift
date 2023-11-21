//
//  ContentView.swift
//  Trigger
//
//  Created by wannabewize on 11/20/23.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Main View")
                    .font(.headline)
                
                NavigationLink("Show Second") {
                    SecondView()
                }
            }
            .padding()
            .onAppear {
                print("Main View Appear")
            }
            .onDisappear {
                print("Main View Disappear")
            }
        }
    }
}

#Preview {
    ContentView()
}
