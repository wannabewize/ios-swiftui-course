//
//  ImageDownloadService.swift
//  SyncAsyncApp
//
//  Created by wannabewize on 11/14/23.
//

import Foundation
import UIKit

// 동기식
func syncDownloadImage(_ urlStr: String) -> UIImage? {
    let url = URL(string: urlStr)!
    let data = try! Data(contentsOf: url)
    print("Download Done")
            
    let image = UIImage(data: data)
    return image
}

// Grand Central Dispatch를 이용한 비동기
func gcdDownloadImage(_ urlStr: String, completion: @escaping (UIImage?) -> Void) {
    DispatchQueue.global().async {
        let url = URL(string: urlStr)!
        let data = try! Data(contentsOf: url)
        print("Download Done", Thread.isMainThread)
        
        let image = UIImage(data: data)
        completion(image)
    }
}


// URLSession 기반의 비동기 네트워크
func sessionBasedTask(_ urlStr: String, completion: @escaping (UIImage?, Error?) -> Void) {
    let url = URL(string: urlStr)!
    let request = URLRequest(url: url)
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        print("Download Done", Thread.isMainThread)

        if let data = data,
           let image = UIImage(data: data) {
            completion(image, nil)
        }
    }
    task.resume()
}

// URLSession 기반의 비동기 네트워크
func sessionBasedTask2(_ urlStr: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
    let url = URL(string: urlStr)!
    let request = URLRequest(url: url)
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        print("Download Done", Thread.isMainThread)
        
        guard error == nil else {
            completion( Result.failure(error!))
            return
        }

        if let data = data,
           let image = UIImage(data: data) {
            completion( Result.success(image) )
        }
    }
    task.resume()
}

// Swift Concurrency를 활용한 비동기 네트워크
func awaitBasedTask(_ urlStr: String) async -> UIImage? {
    let url = URL(string: urlStr)!
    let ret = try? await URLSession.shared.data(from: url)
    print("Download Done")
    
    if let data = ret?.0 {
        let image = UIImage(data: data)
        return image
    }
    
    return nil
}
