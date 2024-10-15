//
//  Model.swift
//  DataAndApp
//
//

import Foundation

struct Movie {
    let poster: String
    let title: String
    let cast: [String]
    let releaseYear: Int
    let grade: String
    let synopsis: String
    let genre: [String]
}

var movie = Movie(poster: "moving_image",
                  title: "무빙",
                  cast: ["류승룡", "한효주", "조인성", "이정하", "고윤정"],
                  releaseYear: 2023,
                  grade: "18세 이상",
                  synopsis: "초능력을 숨긴 채 현재를 살아가는 아이들과, 과거의 아픈 비밀을 감춘 채 살아온 부모들이 시대와 세대를 넘어 닥치는 거대한 위험에 함께 맞서는 초능력 휴먼 액션 시리즈",
                  genre: ["스릴러", "슈퍼 히어로", "액션 어드백처"])
