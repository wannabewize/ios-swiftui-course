//
//  ContentView.swift
//  ListExample
//
//  Created by Jaehoon Lee on 10/13/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            List(movies) { movie in
                MovieItemView(movie: movie)
                .onTapGesture {
                    print("Tapped: ", movie.title)
                }
            }
            .listStyle(.plain) // grouped
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
