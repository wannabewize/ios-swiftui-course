//
//  BookAddView.swift
//  ObservationExample
//
//  Created by wannabewize on 11/12/24.
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
            }
        }
    }
}

#Preview {
    BookAddView()
}
