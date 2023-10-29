//
//  ContentView.swift
//  NavigationStackExample
//
//  Created by Jaehoon Lee on 10/29/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Purple") {
                VStack {
                    Text("Purple View")
                }
            }            
        }
    }
}

#Preview {
    ContentView()
}
