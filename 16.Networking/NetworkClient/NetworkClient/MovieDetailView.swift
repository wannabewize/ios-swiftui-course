//
//  MovieDetail.swift
//  NetworkClient
//
//  Created by wannabewize on 11/20/23.
//

import SwiftUI

struct MovieDetailView: View {
    var movieId: String
    @State var movieDetail: MovieDetail?
    @State var showError = false
    
    var body: some View {
        GeometryReader(content: { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    if let movie = movieDetail {
                        PosterImage(urlStr: movie.poster, width: min(geometry.size.width, geometry.size.height), height: min(geometry.size.width, geometry.size.height))
                            .padding(.bottom, 10)
                        Text(movie.title)
                            .font(.headline)
                        Text("감독 : \(movie.director)")
                        Text("개봉연도 : \(movie.release)")
                        Text("주요 배우 : \(movie.actors.joined(separator: ","))")
                        Text(movie.synopsis ?? "")
                    }
                    else {
                        Text("Loading...")
                    }
                }
                .padding(.horizontal, 20)
            }
            .navigationTitle(movieDetail?.title ?? "")
            .alert("Error", isPresented: $showError, actions: {
                Button("OK") {
                    showError = false
                }
            })
            .onAppear {
//                fetchMovieDetail(movieId: movieId) { data, error in
//                    guard error == nil, let movie = data else {
//                        showError = true
//                        return
//                    }
//                    movieDetail = movie
//                }
                Task {
                    do {
                        let data = try await fetchMovieDetailAsync(movieId: movieId)
                        self.movieDetail = data
                    }
                    catch {
                        showError = true
                    }
                    
                }
            }
        })
    }
}

#Preview {
    MovieDetailView(movieId: "movie01")
}
