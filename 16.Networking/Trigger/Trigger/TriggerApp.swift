//
//  TriggerApp.swift
//  Trigger
//
//  Created by wannabewize on 11/20/23.
//

import SwiftUI

@main
struct TriggerApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("LifeCycle", systemImage: "door.left.hand.closed")
                    }
                ListAndFilterView()
                    .tabItem {
                        Label("Filtered", systemImage: "line.3.horizontal.decrease.circle")
                    }
            }
            
        }
    }
}
