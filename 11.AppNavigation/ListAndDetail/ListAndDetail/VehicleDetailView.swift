//
//  VehicleDetailView.swift
//  ListAndDetail
//
//  Created by wannabewize on 10/30/23.
//

import SwiftUI


struct VehicleDetailView: View {
    var vehicle: Vehicle
    
    @StateObject var webViewController = WebViewObservable()
    
    var body: some View {
        VStack {
            WebView(url: URL(string: vehicle.site), controller: webViewController)
            
        }
        .navigationTitle(vehicle.name)
        .toolbar {
            Button("Reload", systemImage: "arrow.clockwise") {
                webViewController.reload()
            }
        }
    }
}

#Preview {
    VehicleDetailView(vehicle: data[0])
}
