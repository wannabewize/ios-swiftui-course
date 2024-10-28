//
//  TabBasedAppApp.swift
//  TabBasedApp
//
//  Created by wannabewize on 10/30/23.
//

import SwiftUI


@main
struct TabBasedAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ViewA()
                    .tabItem {
                        Label("A", systemImage: "a.circle")
                    }
                ViewB()
                    .tabItem {
                        Label("B", systemImage: "b.circle")
                    }
                ViewC()
                    .tabItem {
                        Label("C", systemImage: "c.circle")
                    }

            }
            
        }
    }
}
