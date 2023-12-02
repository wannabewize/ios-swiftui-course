//
//  SwiftDataExerciseApp.swift
//  SwiftDataExercise
//
//  Created by wannabewize on 12/2/23.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataExerciseApp: App {
    var modelContainer: ModelContainer = {
        let schema = Schema([Item.self])
        let modelConfiguration = ModelConfiguration(schema: schema)
        do {
            return try ModelContainer(for: schema, configurations: modelConfiguration)
        }
        catch {
            fatalError("Error. creating model container \(error)")
        }
        
    }()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(modelContainer)
    }
}
