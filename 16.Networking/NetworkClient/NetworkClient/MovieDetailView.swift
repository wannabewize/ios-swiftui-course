//
//  MovieDetail.swift
//  NetworkClient
//
//  Created by wannabewize on 11/20/23.
//

import SwiftUI

struct TitleField: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .frame(width: 72, alignment: .leading)
            Text(value)
        }
    }
}

struct MovieDetailView: View {
    var movieId: String
    @State var movieDetail: MovieDetail?
    @State var showError = false
    @State var showCommentDialog = false
    @State var comment: String = ""
    
    func postComment() {
        print("comment :", comment)
        comment = ""
    }
    
    var body: some View {
        GeometryReader(content: { geometry in
            List {
                VStack(alignment: .leading, spacing: 16) {
                    if let movie = movieDetail {
                        PosterImage(
                            urlStr: movie.poster,
                            width: min(geometry.size.width, geometry.size.height) * 0.8,
                            height: min(geometry.size.width, geometry.size.height) * 0.8
                        )
                        .padding(.bottom, 10)
                        TitleField(title: "감 독", value: movie.director)
                        TitleField(title: "개봉 연도", value: String(format: "%d", movie.release))
                        TitleField(title: "주요 배우", value: movie.actors.joined(separator: ","))

                        Text(movie.synopsis ?? "")
                            .font(.footnote)
                        
                        HStack {
                            Text("댓글")
                                .font(.headline)
                            Spacer()
                            Button(action: {
                                showCommentDialog = true
                            }, label: {
                                Image(systemName: "plus.circle")
                            })
                        }
                        
                        ForEach(movie.comments) { item in
                            Text(item.comment)
                        }
                    }
                    else {
                        Text("Loading...")
                    }
                }
                
            }
            .listStyle(.plain)
            .navigationTitle(movieDetail?.title ?? "")
            .alert("Error", isPresented: $showError, actions: {
                Button("OK") {
                    showError = false
                }
            })
            .alert("댓글 작성", isPresented: $showCommentDialog, actions: {
                TextField("댓글 입력", text: $comment)
                Button("입력") {
                    postComment()
                }
                Button("취소", role: .cancel) {
                    comment = ""
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
