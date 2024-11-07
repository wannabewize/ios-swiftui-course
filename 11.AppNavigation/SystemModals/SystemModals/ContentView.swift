//
//  ContentView.swift
//  SystemModals
//
//  Created by wannabewize on 11/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PhotoPickerView()
                .tabItem {
                    Label("Photo", systemImage: "photo")
                }
        }
    }
}

#Preview {
    ContentView()
}
