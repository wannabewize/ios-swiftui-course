//
//  ContentView.swift
//  DynamicListExample
//
//  Created by wannabewize on 11/4/24.
//

import SwiftUI

// For Keypath
struct InnerItem {
    let innerId: Int
}

struct WrapperItem {
    let inner: InnerItem
}

struct CustomItem {
    let id: Int
    let title: String
}

struct CustomItem2: Identifiable {
    let id: Int
    let title: String
}

struct CustomItem3: Identifiable {
    let id = UUID()
    let title: String
}

struct ContentView: View {
    let textData = ["item a", "item b", "item c", "item d"]
    let numericData = [1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5]
    let customData = [
        CustomItem(id: 1, title: "일"),
        CustomItem(id: 2, title: "이"),
        CustomItem(id: 3, title: "삼"),
        CustomItem(id: 4, title: "사"),
        CustomItem(id: 5, title: "오"),
    ]
    let customData2 = [
        CustomItem2(id: 1, title: "하나"),
        CustomItem2(id: 2, title: "둘"),
        CustomItem2(id: 3, title: "셋"),
        CustomItem2(id: 4, title: "넷"),
        CustomItem2(id: 5, title: "다섯"),
    ]
    
    let customData3 = [
        CustomItem3(title: "one"),
        CustomItem3(title: "two"),
        CustomItem3(title: "three"),
        CustomItem3(title: "four"),
        CustomItem3(title: "five"),
    ]

    var body: some View {
        VStack {
            List(textData, id: \.self) { item in
                Text(item)
            }
            List() {
                ForEach(numericData, id: \.self) { item in
                    Text("Item \(item)")
                }
            }
            
            List(customData, id: \.id) { item in
                Text("Item \(item.title)")
            }
            
            List(customData2) { item in
                Text("Item \(item.title)")
            }
            
            List {
                ForEach(customData3) { item in
                    Text("Item \(item.title)")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
