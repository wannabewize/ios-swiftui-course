//
//  ShowRoomsView.swift
//  TabAndNavigation
//
//  Created by wannabewize on 10/30/23.
//

import SwiftUI
import MapKit

struct ShowRoomsView: View {
    var body: some View {
        Map {
            ForEach(showrooms) { item in
                Marker(item.name, coordinate: CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude))
            }
        }
    }
}

#Preview {
    ShowRoomsView()
}
