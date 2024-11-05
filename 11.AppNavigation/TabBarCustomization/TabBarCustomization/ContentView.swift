//
//  ContentView.swift
//  TabBarCustomization
//
//  Created by wannabewize on 11/6/24.
//

import SwiftUI

struct SubView1: View {
    var body: some View {
        VStack {
            Text("SubView1")
        }
    }
}

struct SubView2: View {
    var body: some View {
        VStack {
            Text("SubView1")
        }
        .toolbarBackground(Color.red, for: .tabBar)
        .toolbarBackgroundVisibility(.visible, for: .tabBar)
    }
}

struct SubView3: View {
    var body: some View {
        VStack {
            Text("SubView1")
        }
    }
}


struct ContentView: View {
    var body: some View {
        TabView {
            SubView1()
                .tabItem {
                    Label("A", systemImage: "a.circle")
                }
            SubView2()
                .tabItem {
                    Label("B", systemImage: "b.circle")
                }
            SubView3()
                .tabItem {
                    Label("C", systemImage: "c.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
