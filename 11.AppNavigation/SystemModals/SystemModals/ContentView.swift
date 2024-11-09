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
            DatePickerView()
                .tabItem {
                    Label("Date", systemImage: "calendar")
                }
            PhotoPickerView()
                .tabItem {
                    Label("Photo", systemImage: "photo")
                }
            FileExportView()
                .tabItem {
                    Label("File", systemImage: "doc")
                }
        }
    }
}

#Preview {
    ContentView()
}
