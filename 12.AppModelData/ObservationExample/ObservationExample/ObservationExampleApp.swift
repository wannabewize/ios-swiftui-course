//
//  ObservationExampleApp.swift
//  ObservationExample
//
//  Created by wannabewize on 11/12/24.
//

import SwiftUI

@main
struct ObservationExampleApp: App {
    var library = Library(books: ["해리포터"])
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(library)
        }
    }
}
