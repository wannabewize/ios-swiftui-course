//
//  NewTodoComposeView.swift
//  SwiftDataApp
//

import SwiftUI

struct NewTodoComposeView: View {
    @State var title: String = ""
    @State var date: Date = Date()
    
    // For Confirm
    var addTodo: (String, Date) -> Void
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text("New Todo").font(.headline)
            TextField("title", text: $title)
            DatePicker("due date", selection: $date, displayedComponents: .date)
            
            
            HStack(spacing: 20) {
                Spacer()
                Button("Cancel", role: .cancel) {
                    dismiss()
                }
                .buttonStyle(.bordered)
                Button("OK") {
                    dismiss()
                    addTodo(title, date)
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
    }
}

#Preview {
    NewTodoComposeView { title, date in }
}
