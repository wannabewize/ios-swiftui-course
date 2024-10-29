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
        GridItem(.flexible()),
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: items, spacing: 20) {
                ForEach(movies) { item in
                    VStack {
                        Image(item.image, bundle: nil)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text(item.title)
                            .minimumScaleFactor(0.5)
                            .frame(height: 20)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
