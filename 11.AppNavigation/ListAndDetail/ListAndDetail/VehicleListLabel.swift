//
//  VehicleListLabel.swift
//  ListAndDetail
//
//  Created by wannabewize on 11/6/24.
//
import SwiftUI

struct VehicleListLabel: View {
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

#Preview {
    VehicleListLabel(vehicle: data[0])
}
