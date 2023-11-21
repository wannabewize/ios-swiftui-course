//
//  ContentView.swift
//  NetworkClient
//

import SwiftUI

struct ContentView: View {
    @State var showError = false
    @State var errorMessage: String?
    @State var movies: [Movie] = []
    
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    ForEach(movies) { movie in
                        NavigationLink {
                            MovieDetailView(movieId: movie.id)
                        } label: {
                            HStack {
                                PosterImage(urlStr: movie.poster, width: 60, height: 60)
                                VStack(alignment: .leading) {
                                    Text(movie.title)
                                        .font(.headline)
                                    Text(String(format: "%d", movie.release))
                                        .font(.subheadline)
                                }
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }            
            .alert(errorMessage ?? "Error", isPresented: $showError, actions: {
                Button("OK") {
                    showError = false
                }
            })
        }
        .padding()
        .onAppear {
            // 비동기 방식의 네트워크 - 1
            fetchMovies { data, error in
                guard error == nil, let movies = data else {
                    showError = true
                    errorMessage = "영화 정보 조회 실패"
                    return
                }
                self.movies = movies
            }
            
            // 비동기 방식의 네트워크 - 2
//            Task {
//                do {
//                    if let movies = try await fetchMovieAsync() {
//                        self.movies = movies
//                    }
//                }
//                catch {
//                    errorMessage = "영화 정보 조회 실패"
//                    showError = true
//                }
//
//            }
        }
    }
}

#Preview {
    ContentView()
}
