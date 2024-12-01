//
//  CoreDataAppApp.swift
//  CoreDataApp
//
//  Created by wannabewize on 12/1/24.
//

import SwiftUI

@main
struct CoreDataAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
