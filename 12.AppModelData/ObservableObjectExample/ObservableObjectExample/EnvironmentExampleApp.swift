//
//  EnvironmentExampleApp.swift
//  EnvironmentExample
//
//

import SwiftUI

@main
struct EnvironmentExampleApp: App {
    @State var counter = Counter()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(counter)
        }
    }
}
