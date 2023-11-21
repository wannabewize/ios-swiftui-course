//
//  API.swift
//  LoginAndToken
//
//  Created by wannabewize on 11/21/23.
//

import Foundation
import Alamofire

class TokenInterceptor: RequestInterceptor {
    var token: String?
    
    static var shared = TokenInterceptor()
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        request.setValue(token, forHTTPHeaderField: "Authorization")
        completion(.success(request))
    }
}

var token: String?

struct Comment: Codable {
    let id: String
    let comment: String
}

struct CommonResponse<T: Codable>: Codable {
    let msg: String
    let data: T
}

func signIn(id: String, password: String, handler: @escaping (String?) -> Void) {
    let url = URL(string: "\(ServerAddress)/auth/login")
    var request = URLRequest(url: url!)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    // HTTP Message body
    let payload = [
        "id": id, "password": password
    ]
    let encoded = try? JSONEncoder().encode(payload)
    request.httpBody = encoded
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data else {
            print("data is nil!")
            return
        }
        
        if let decoded = try? JSONDecoder().decode(CommonResponse<String>.self, from: data) {
            token = decoded.data
            print("token saved:", token)
            handler(decoded.data)
        }
        else {
            print("Decode error")
            handler(nil)
        }
    }
    .resume()
}

func signIn2(id: String, password: String, handler: @escaping (String?) -> Void) {
    let url = URL(string: "\(ServerAddress)/auth/login")
    let params = ["id": id, "password": password]
    AF.request(url!, method: .post, parameters: params, encoding: JSONEncoding.default)
        .responseDecodable(of: CommonResponse<String>.self) { response in
            switch response.result {
            case .success(let ret):
                let token = ret.data
                TokenInterceptor.shared.token = token
                handler(token)
                
            case .failure(let error):
                print("Error ", error)
                handler(nil)
            }
    }
}



func postComment(movieId: String, comment: String, handler: @escaping (Comment?) -> Void) {
    guard let token = token else {
        print("token is nil")
        return
    }
    
    let url = URL(string: "\(ServerAddress)/api/movies/\(movieId)/comments")
    var request = URLRequest(url: url!)
    request.httpMethod = "POST"
    
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue(token, forHTTPHeaderField: "Authorization")
    
    // HTTP Message body
    let payload = [
        "comment": comment
    ]
    let encoded = try? JSONEncoder().encode(payload)
    request.httpBody = encoded
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data else {
            print("data is nil!")
            return
        }
        
        if let decoded = try? JSONDecoder().decode(CommonResponse<Comment>.self, from: data) {
            print("decoded :", decoded)
            handler(decoded.data)
        }
        else {
            print("Decode error")
            handler(nil)
        }
    }
    .resume()
}

func postComment2(movieId: String, comment: String, handler: @escaping (Comment?) -> Void) {
    let url = URL(string: "\(ServerAddress)/api/movies/\(movieId)/comments")
    let params = ["comment": comment]
    AF.request(url!,
               method: .post,
               parameters: params,
               encoding: JSONEncoding.default, interceptor: TokenInterceptor.shared)
        .responseDecodable(of: CommonResponse<Comment>.self) { response in
            switch response.result {
            case .success(let ret):
                let commentRet = ret.data
                handler(commentRet)
                
            case .failure(let error):
                print("Error ", error)
                handler(nil)
            }
    }
}
