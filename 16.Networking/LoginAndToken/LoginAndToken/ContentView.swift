//
//  ContentView.swift
//  LoginAndToken
//
//  Created by wannabewize on 11/21/23.
//

import SwiftUI

let ServerAddress = "http://localhost:3000"

struct ContentView: View {
    @State var token: String?
    @State var commentInput: String = ""
    @State var commentRet: Comment?
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("로그인1") {
                    signIn(id: "user", password: "1234") { ret in
                        token = ret
                    }
                }
                Button("로그인 - AF") {
                    signIn2(id: "user", password: "1234") { ret in
                        token = ret
                    }
                }
            }
            
            Text("Token : \(token ?? "")")
            TextField("댓글", text: $commentInput).lineLimit(5)
            
            HStack(spacing: 20) {
                Button("댓글 작성") {
                    postComment(movieId: "movie01", comment: commentInput) { ret in
                        commentRet = ret                    }
                }
                Button("댓글 작성2(AF)") {
                    postComment2(movieId: "movie01", comment: commentInput) { ret in
                        commentRet = ret
                    }
                }
            }
            Text("댓글 작성 결과")
            Text("댓글 id: \(commentRet == nil ? "실패" : commentRet!.id)")
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
