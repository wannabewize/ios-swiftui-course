//
//  ContentView.swift
//  ListWithWrongID
//
//  Created by wannabewize on 11/5/24.
//

import SwiftUI

struct ListItem: Identifiable {
    let id: Int
    let title: String
}

struct ContentView: View {
    let data = [
        ListItem(id: 0, title: "item-0"),
        ListItem(id: 1, title: "item-1"),
        ListItem(id: 2, title: "item-2"),
        ListItem(id: 3, title: "item-3"),
        ListItem(id: 4, title: "item-4"),
        ListItem(id: 5, title: "item-5"),
        ListItem(id: 0, title: "item-6"),
        ListItem(id: 1, title: "item-7"),
        ListItem(id: 2, title: "item-8"),
        ListItem(id: 3, title: "item-9"),
        ListItem(id: 4, title: "item-10"),
        ListItem(id: 5, title: "item-11"),
        ListItem(id: 0, title: "item-12"),
        
    ]
    var body: some View {
        VStack {
            List(data) { item in
                Text(item.title)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
