//
//  ContentView.swift
//  GridExample
//
//  Created by wannabewize on 2/8/24.
//

import SwiftUI

struct ContentView: View {
    let items = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: items, spacing: 20) {
                ForEach(movies) { item in
                    MovieItemView(movie: item)
                    .onTapGesture {
                        print("tap gesture", item.title)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


