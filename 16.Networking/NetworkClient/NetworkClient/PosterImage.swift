//
//  PosterImage.swift
//  NetworkClient
//
//  Created by wannabewize on 11/21/23.
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
                else {
                    Image(systemName: "film")
                        .resizable()
                        .frame(width: width, height: height)
                }
            }
        }
        else {
            Image(systemName: "film")
                .resizable()
                .frame(width: width, height: height)
        }
    }
}

#Preview {
    PosterImage(urlStr: "", width: 60, height: 60)
//    PosterImage()
}
