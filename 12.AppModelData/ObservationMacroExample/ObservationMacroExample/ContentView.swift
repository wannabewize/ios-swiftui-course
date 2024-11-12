//
//  ContentView.swift
//  ObservationExample
//

import SwiftUI

struct ContentView: View {
    @Environment(Library.self) private var library
    
    var body: some View {
        VStack {
            BookAddView()
            BookListView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(Library(books: ["book1", "book2"]))
}
