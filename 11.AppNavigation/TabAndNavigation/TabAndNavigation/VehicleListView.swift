//
//  ContentView.swift
//  ListAndDetailApp
//

import SwiftUI

struct VehicleCell: View {
    var vehicle: Vehicle
    
    var body: some View {
        HStack {
            Image(vehicle.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 90, height: 60)
            VStack(alignment: .leading) {
                Text(vehicle.name)
                    .font(.headline)
                Text(vehicle.brand)
                    .font(.footnote)
            }
            Spacer()
            Image(systemName: vehicle.fuelType.imageName)
        }
    }
}

struct VehicleListView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(data) { vehicle in
                    NavigationLink {
                        VehicleDetailView(vehicle: vehicle)
                    } label: {
                        VehicleCell(vehicle: vehicle)
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
    VehicleListView()
}
