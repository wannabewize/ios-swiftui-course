//
//  ContentView.swift
//  ObservationExample
//
//  Created by wannabewize on 11/12/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(Library.self) var library
    
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
