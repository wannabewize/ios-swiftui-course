//
//  MovieApi.swift
//  NetworkClient
//

import Foundation

enum CustomError: Error {
    case someError
}

// Identifiable : id Hashable 프로퍼티
struct Movie: Codable, Identifiable {
    let id: String
    let title: String
    let release: Int
    let poster: String?
}

struct MovieDetail: Codable {
    let id: String
    let title: String
    let director: String
    let release: Int
    let poster: String?
    let synopsis: String?
    let actors: [String]
}
    

struct ResponseWrapper<T: Codable>: Codable {
    let data: T
}

// 에러 처리 필요.
// completion handler 방식의 비동기 코드는 클로저의 파라미터로
func fetchMovies(completionHandler: @escaping ([Movie]?, Error?) -> Void) {
    let url = URL(string: "http://localhost:3000/api/movies")!
    let request = URLRequest(url: url)
    
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        // status code 값을 얻기 위해 HTTP Response로 타입 변환
        // data 옵셔널 바인딩
        guard let httpResponse = response as? HTTPURLResponse,
              let data = data else {
            return
        }
        
        // 성공 메시지
        guard (200..<300).contains(httpResponse.statusCode) else {
            completionHandler(nil, CustomError.someError)
            return
        }
        
        do {
            // JSON 디코딩
            let decoded = try JSONDecoder().decode(ResponseWrapper<[Movie]>.self, from: data)
            let movies = decoded.data
            // 성공 - completion handler를 이용해서 결과 전달
            completionHandler(movies, nil)
        }
        catch {
            completionHandler(nil, error)
        }
    }.resume()
}

func fetchMovieAsync() async throws -> [Movie]? {
    let url = URL(string: "http://localhost:3000/api/movies")!
    let ret = try await URLSession.shared.data(from: url)
    
    let data: Data = ret.0
    let response: HTTPURLResponse = ret.1 as! HTTPURLResponse
    
    print("status code :", response.statusCode)
    let contentType = response.value(forHTTPHeaderField: "content-type")
    print("contentType :", contentType!)
    
    do {
        let decoded = try JSONDecoder().decode(ResponseWrapper<[Movie]>.self, from: data)
        let movies = decoded.data
        return movies
    }
    catch {
        throw CustomError.someError
    }
}


func fetchMovieDetail(movieId: String, completionHandler: @escaping (MovieDetail?, Error?) -> Void) {
    let url = URL(string: "http://localhost:3000/api/movies/\(movieId)")!
    let request = URLRequest(url: url)
    
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        // status code 값을 얻기 위해 HTTP Response로 타입 변환
        // data 옵셔널 바인딩
        guard let httpResponse = response as? HTTPURLResponse,
              let data = data else {
            return
        }
        
        // 성공 메시지
        guard (200..<300).contains(httpResponse.statusCode) else {
            completionHandler(nil, CustomError.someError)
            return
        }
        
        do {
            // JSON 디코딩
            let decoded = try JSONDecoder().decode(ResponseWrapper<MovieDetail>.self, from: data)
            let movie = decoded.data
            // 성공 - completion handler를 이용해서 결과 전달
            completionHandler(movie, nil)
        }
        catch {
            completionHandler(nil, error)
        }
    }.resume()
}

func fetchMovieDetailAsync(movieId: String) async throws -> MovieDetail? {
    let url = URL(string: "http://localhost:3000/api/movies/\(movieId)")!
    let ret = try await URLSession.shared.data(from: url)
    
    let data: Data = ret.0
    let response: HTTPURLResponse = ret.1 as! HTTPURLResponse
    guard (200..<300).contains(response.statusCode) else {
        throw CustomError.someError
    }
    
    do {
        let decoded = try JSONDecoder().decode(ResponseWrapper<MovieDetail>.self, from: data)
        let movie = decoded.data
        return movie
    }
    catch {
        throw CustomError.someError
    }
}

