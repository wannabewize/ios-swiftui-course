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
                        
                    } label: {
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
