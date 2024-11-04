//
//  MovieItemView.swift
//  GridExample
//
//  Created by wannabewize on 11/5/24.
//
import SwiftUI

struct MovieItemView: View {
    var movie: Movie
    var body: some View {
        VStack {
            Image(movie.image, bundle: nil)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(movie.title)
                .minimumScaleFactor(0.5)
                .frame(height: 20)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    MovieItemView(movie: movies[0])
}
