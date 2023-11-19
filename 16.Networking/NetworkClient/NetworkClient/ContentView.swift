//
//  ContentView.swift
//  NetworkClient
//

import SwiftUI

// 비동기 방식의 이미지 뷰 - 다운로드 완료 후 이미지 리사이징
struct PosterImage: View {
    var urlStr: String?
    var width, height: CGFloat
    
    var body: some View {
        if let urlStr = urlStr, let url = URL(string: urlStr) {
            AsyncImage(url: url) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: width, height: height)
                }
            }
        }
        else {
            Image(systemName: "film")
                .resizable()
                .frame(height: 80)
        }
    }
}

struct ContentView: View {
    @State var showError = false
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
                                PosterImage(urlStr: movie.poster, width: 80, height: 80)
                                Text(movie.title)
                                Text("\(movie.release)")
                            }
                        }
                    }
                }
            }
            .alert("Error", isPresented: $showError, actions: {
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
