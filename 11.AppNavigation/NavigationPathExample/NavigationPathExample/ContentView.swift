//
//  ContentView.swift
//  NavigationPathExample
//
//  Created by wannabewize on 11/5/24.
//

import SwiftUI

struct ContentView: View {
    @State var navigationPath = NavigationPath()
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack(spacing: 20) {
                NavigationLink("SubView로 이동. navigationDestination", value: 1)
                
                NavigationLink("SubView로 이동. Destination Direct") {
                    SubView(navigationPath: $navigationPath)
                }
            }
            .navigationDestination(for: Int.self, destination: { value in
                SubView(navigationPath: $navigationPath)
            })
            .navigationTitle("Navigation Path Example")
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
