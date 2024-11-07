//
//  ContentView.swift
//  DialogExample
//
//  Created by Jaehoon Lee on 11/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AlertView()
                .tabItem {
                    Label("Alert", systemImage: "a.circle")
                }
            ActionSheet()
                .tabItem {
                    Label("ActionSheet", systemImage: "b.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
