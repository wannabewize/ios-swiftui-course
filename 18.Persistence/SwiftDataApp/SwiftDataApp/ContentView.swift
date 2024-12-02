//
//  ContentView.swift
//  SwiftDataApp
//
//  Created by Jaehoon Lee on 12/2/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State var isNewTodoAlertVisible = false
    @State var isTitleEditAlertVisible = false
    @State var newTitle = ""
    @State var todoForEdit: Todo?
    @Query private var todos: [Todo]

    var body: some View {
        NavigationView {
            List {
                ForEach(todos) { todo in
                    HStack {
                        VStack(alignment: .center) {
                            Text(todo.title)
                                .font(.headline)
                            Text(todo.dueDate, format: Date.FormatStyle(date: .abbreviated, time: .none))
                                .font(.caption)
                        }
                        Spacer()
                        Button {
                            todoForEdit = todo
                            newTitle = todoForEdit!.title
                            isTitleEditAlertVisible = true
                        } label: {
                            Image(systemName: "pencil")
                        }
                    }
                    .alert("edit todo", isPresented: $isTitleEditAlertVisible) {
                        TextField("title", text: $newTitle)
                        Button("Cencel", role: .cancel) {
                            newTitle = ""
                        }
                        Button("OK") {
                            todoForEdit!.title = newTitle
                            do {
                                try modelContext.save()
                            }
                            catch {
                                print("Error ", error)
                            }                            
                        }
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
            .sheet(isPresented: $isNewTodoAlertVisible) {
                NewTodoComposeView(addTodo: addItem)
            }
        }
    }

    private func addItem(title: String, dueDate: Date) {
        withAnimation {
            let newItem = Todo(title: title, dueDate: dueDate)
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(todos[index])
            }
        }
    }
}

#Preview {
    @Previewable let container = {
        let schema = Schema([ Todo.self, ])
        let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: schema, configurations: config)
        let context = container.mainContext
        
        let todo1 = Todo(title: "todo1", dueDate: Date())
        container.mainContext.insert(todo1)
        
        let todo2 = Todo(title: "todo2", dueDate: Date().advanced(by: 60 * 60 * 24))
        container.mainContext.insert(todo2)

        return container
    }()
    
    
    ContentView()
        .modelContainer(container)
}
