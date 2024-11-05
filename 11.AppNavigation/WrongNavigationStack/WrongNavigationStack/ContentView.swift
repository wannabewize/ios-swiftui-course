//
//  ContentView.swift
//  WrongNavigationStack
//
//  Created by wannabewize on 11/6/24.
//

import SwiftUI

struct SubView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Subview") {
                    SubView()
                }
            }
            .navigationTitle("Sub")
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Subview with Navigation Stack") {
                    SubView()
                }
            }
            .navigationTitle("Main")
            .padding()
            
        }
    }
}

#Preview {
    ContentView()
}
