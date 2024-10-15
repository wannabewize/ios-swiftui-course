//
//  ContentView.swift
//  DataAndApp
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            ZStack {
                Image(movie.poster)
                
                VStack {
                    Spacer()
                    HStack {
                        Text(movie.title)
                            .foregroundStyle(.white)
                            .font(Font.system(size: 40))
                        Spacer()
                    }
                    .padding(.leading, 20)
                }
            }
            .frame(height: 200)
            
            VStack(spacing: 10) {
                HStack {
                    Text("공개")
                        .frame(width: 80, alignment: .leading)
                        .bold()
                    Text(String(movie.releaseYear))
                    Spacer()
                }
                HStack {
                    Text("관람등급")
                        .frame(width: 80, alignment: .leading)
                        .bold()
                    Text(movie.grade)
                    Spacer()
                }
                HStack {
                    Text("장르")
                        .frame(width: 80, alignment: .leading)
                        .bold()
                    Text(movie.genre.joined(separator: ", "))
                    Spacer()
                }
                
                Text(movie.synopsis)
                    .font(Font.system(.body))
                
                HStack {
                    Text("출연")
                        .frame(width: 80, alignment: .leading)
                        .bold()
                    Text(movie.cast.joined(separator: ", "))
                    Spacer()
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
                        
            VStack {
                HStack {
                    Text("좋아하실 만한 콘텐츠")
                        .font(Font.system(.headline))
                    Spacer()
                }
                HStack {
                    Image("movie1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image("movie2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
            }
            .padding(.top, 20)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            
            
            Spacer()
            
            
        }
        .padding(0)
    }
}

#Preview {
    ContentView()
}
