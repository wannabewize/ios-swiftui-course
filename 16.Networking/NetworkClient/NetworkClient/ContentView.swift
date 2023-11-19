//
//  ContentView.swift
//  NetworkClient
//
//  Created by wannabewize on 11/18/23.
//

import SwiftUI

// Identifiable : id Hashable 프로퍼티
struct Movie: Codable, Identifiable {
    let id: String
    let title: String
    let director: String
    let poster: String?
}

struct ResponseWrapper: Codable {
    let data: [Movie]
}

struct PosterImage: View {
    var urlStr: String?
    var body: some View {
        if let urlStr = urlStr, let url = URL(string: urlStr) {
            AsyncImage(url: url) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 80)
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
    @State var movies: [Movie] = []
    
    var body: some View {
        VStack {
            List {
                ForEach(movies) { movie in
                    HStack {
                        PosterImage(urlStr: movie.poster)
                        Text(movie.title)
                    }
                }
            }
        }
        .padding()
        .onAppear {
            Task {
                let url = URL(string: "http://localhost:3000/api/movies")!
                let ret = try await URLSession.shared.data(from: url)
                
                let data: Data = ret.0
                let response: HTTPURLResponse = ret.1 as! HTTPURLResponse
                
                print("status code :", response.statusCode)
                let contentType = response.value(forHTTPHeaderField: "content-type")
                print("contentType :", contentType!)
                
                if let decoded = try? JSONDecoder().decode(ResponseWrapper.self, from: data) {
                    movies = decoded.data
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
