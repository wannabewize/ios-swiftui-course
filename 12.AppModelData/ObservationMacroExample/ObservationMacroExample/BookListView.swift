//
//  BookListView.swift
//  ObservationExample
//

import SwiftUI

struct BookListView: View {
    @Environment(Library.self) var library
    
    var body: some View {
        List(library.books) { book in
            Text(book.title)
        }
    }
}

#Preview {
    BookListView()
        .environment(Library(books: ["Book1", "Book2"]))
}
