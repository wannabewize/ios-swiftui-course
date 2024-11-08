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
            NavigationStack {
                AlertView()
                    .navigationTitle("Alert")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbarBackground(Color.gray, for: .navigationBar)
                    .toolbarBackgroundVisibility(.visible, for: .navigationBar)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("Right Button") { print("Right Button") }
                        }
                    }
            }
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
