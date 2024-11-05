//
//  ContentView.swift
//  ListAndDetailApp
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(data) { vehicle in
                    NavigationLink {
                        VehicleDetailView(vehicle: vehicle)
                    } label: {
                        VehicleListLabel(vehicle: vehicle)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Vehicles")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        .padding()
    }
}

#Preview {
    ContentView()
}


