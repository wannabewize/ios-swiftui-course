//
//  BookAddView.swift
//  ObservationExample
//

import SwiftUI

struct BookAddView: View {
    @Environment(Library.self) var library
    
    @State var isAlertVisible = false
    @State var bookTitle = ""
    
    var body: some View {
        VStack {
            Button("Add Book") {
                isAlertVisible = true
            }
            .alert("New Book", isPresented: $isAlertVisible) {
                TextField("Book Title", text: $bookTitle)
                Button("Cancel", role: .cancel) { bookTitle = "" }
                Button("Add") {
                    library.addBook(title: bookTitle)
                    bookTitle = ""
                }
                .disabled(bookTitle.count == 0)
                
                Button("Add Async") {
                    library.addBookAsync(title: bookTitle)
                    bookTitle = ""
                }
                .disabled(bookTitle.count == 0)
            }
        }
    }
}

#Preview {
    BookAddView()
}
