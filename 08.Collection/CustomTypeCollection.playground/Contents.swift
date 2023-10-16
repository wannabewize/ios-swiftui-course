/**
 커스텀 타입과 콜렉션
 */

struct Movie {
    var title : String
    var year : Int
}

// 커스텀 타입의 배열
var movies = [
    Movie(title: "스타워즈", year: 1977),
    Movie(title: "제국의 역습", year: 1980)
]

// 원소 추가
movies.append(Movie(title: "제다이의 귀환", year: 1983))

print("movies :", movies)

// 배열에서 원소 얻기
let item: Movie = movies[2]
print("movies[2] :", item)


