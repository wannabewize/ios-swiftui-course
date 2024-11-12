//
//  EnvironmentExampleApp.swift
//  EnvironmentExample
//
//

import SwiftUI

@main
struct EnvironmentExampleApp: App {
    @StateObject var counter = Counter()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(counter)
        }
    }
}
