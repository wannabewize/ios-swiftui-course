//
//  ContentView.swift
//  ViewLifeCycle
//
//  Created by wannabewize on 11/6/24.
//

import SwiftUI

struct SubView1: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("SubView1")
                .font(.headline)
        }
        .onAppear {
            print("SubView1 appear")
        }
        .onDisappear {
            print("SubView1 disappear")
        }
    }
}

struct SubView2: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("SubView2")
                .font(.headline)
            
            NavigationLink("SubView3") {
                SubView3()
            }
        }
        .onAppear {
            print("SubView2 appear")
        }
        .onDisappear {
            print("SubView2 disappear")
        }
    }
}

struct SubView3: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("SubView3")
                .font(.headline)
                .onAppear {
                    print("Text in SubView3 appear")
                }
                .onDisappear {
                    print("Text in SubView3 disappear")
                }
        }
        .onAppear {
            print("SubView3 appear")
        }
        .onDisappear {
            print("SubView3 disappear")
        }
    }
}

struct NaviSubView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("SubView2") {
                SubView2()
            }
        }
        .onAppear {
            print("NaviSubView appear")
        }
        .onDisappear {
            print("NaviSubView disappear")
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
            NaviSubView()
                .tabItem {
                    Label("B", systemImage: "b.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
