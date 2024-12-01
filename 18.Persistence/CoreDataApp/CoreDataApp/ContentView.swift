//
//  ContentView.swift
//  CoreDataApp
//
//  Created by wannabewize on 12/1/24.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var isNewTodoAlertVisible = false

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Todo.dueDate, ascending: true)],
        animation: .default)
    private var todos: FetchedResults<Todo>

    var body: some View {
        NavigationView {
            List {
                ForEach(todos) { todo in
                    HStack(alignment: .center) {
                        Text(todo.title!)
                            .font(.headline)
                        Text(todo.dueDate!, formatter: itemFormatter)
                            .font(.caption)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button {
                        isNewTodoAlertVisible = true
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("ToDo with CoreData")
            .sheet(isPresented: $isNewTodoAlertVisible) {
                NewTodoComposeView(addTodo: addItem)
            }
        }
    }
    

    private func addItem(title: String, dueDate: Date) {
        withAnimation {
            let newTodo = Todo(context: viewContext)
            newTodo.title = title
            newTodo.dueDate = dueDate

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { todos[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .none
    return formatter
}()

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
