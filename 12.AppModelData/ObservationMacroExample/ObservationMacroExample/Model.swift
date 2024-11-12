//
//  Model.swift
//  ObservationExample
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
    
    // 1초후 실행. 비동기 동작
    func addBookAsync(title: String) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.addBook(title: title)
        }
    }
}
