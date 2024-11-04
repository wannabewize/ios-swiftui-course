//
//  MovieView.swift
//  ListAndCustomType
//
//  Created by wannabewize on 10/30/24.
//
import SwiftUI

struct MovieItemView: View {
    let movie: Movie
    
    var body: some View {
        HStack {
            Image(movie.image, bundle: nil)
                .resizable()
                .frame(width: 60, height: 60)
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.actor)
                    .font(.callout)
            }
        }
    }
}

#Preview {
    MovieItemView(movie: movies[0])
}

