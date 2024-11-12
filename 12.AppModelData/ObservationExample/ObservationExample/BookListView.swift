//
//  BookListView.swift
//  ObservationExample
//
//  Created by wannabewize on 11/12/24.
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
