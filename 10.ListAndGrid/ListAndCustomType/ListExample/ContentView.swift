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
            List {
                ForEach(movies) { movie in
                    MovieCell(movie: movie)
                    .onTapGesture {
                        print("Cell Touched ", movie.title)
                    }
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
