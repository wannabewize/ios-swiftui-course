//
//  NavigationItems.swift
//  ListAndDetailApp
//
//  Created by Jaehoon Lee on 10/29/23.
//

import SwiftUI

struct NavigationExamView: View {
    struct DetailView: View {
        var body: some View {
            Text("Detail")
        }
    }
    
    let vehicle = data[0]
    
    var body: some View {
        NavigationStack {
            
            NavigationLink("Click") {
                DetailView()
            }
            
            NavigationLink {
                DetailView()
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
        .padding()
    }
}

#Preview {
    NavigationExamView()
}
