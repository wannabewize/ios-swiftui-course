//
//  Model.swift
//  ObservationExample
//
//  Created by wannabewize on 11/12/24.
//

import SwiftUI


struct Book: Identifiable {
    var id = UUID()
    var title: String
}

// iOS17
@Observable
class Library {
    var books: [Book]
    
    init(books: [String]) {
        self.books = books.map({ title in
            Book(title: title)
        })
    }
    
    func addBook(title: String) {
        books.append(Book(title: title))
    }
}
