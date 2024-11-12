//
//  ObservationExampleApp.swift
//  ObservationExample
//

import SwiftUI

@main
struct ObservationMacroExampleApp: App {
    @State private var library = Library(books: ["해리포터"])
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(library)
        }
    }
}
