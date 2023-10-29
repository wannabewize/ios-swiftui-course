//
//  ListAndDetailAppApp.swift
//  ListAndDetailApp
//

import SwiftUI

@main
struct TabAndNavigationApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                VehicleListView()
                    .tabItem {
                        Label("Vehicles", systemImage: "car")
                    }
                ShowRoomsView()
                    .tabItem {
                        Label("Show Rooms", systemImage: "storefront")
                    }
            }
        }
    }
}
