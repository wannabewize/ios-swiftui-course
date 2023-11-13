//
//  ContentView.swift
//  SyncAsyncApp
//
//  Created by wannabewize on 11/13/23.
//

import SwiftUI

// 4mb image
let urlStr = "https://upload.wikimedia.org/wikipedia/commons/f/f4/The_Scream.jpg"


struct ContentView: View {
    @State var image: UIImage?
    @State var value: Float = 0.5
    
    // 동기식
    func syncDownloadImage() -> UIImage? {
        let url = URL(string: urlStr)!
        let data = try! Data(contentsOf: url)
        print("Download Done")
                
        image = UIImage(data: data)
        return image
    }
    
    // Grand Central Dispatch를 이용한 비동기
    func gcdDownloadImage(_ completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async {
            let url = URL(string: urlStr)!
            let data = try! Data(contentsOf: url)
            print("Download Done", Thread.isMainThread)
            
            let image = UIImage(data: data)
            completion(image)
        }
    }
    
    
    // URLSession 기반의 비동기 네트워크
    func sessionBasedTask(_ completion: @escaping (UIImage?) -> Void) {
        let url = URL(string: urlStr)!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            print("Download Done", Thread.isMainThread)

            if let data = data,
               let image = UIImage(data: data) {
                completion(image)
            }
        }
        task.resume()
    }
    
    // Swift Concurrency를 활용한 비동기 네트워크
    func awaitBasedTask() async -> UIImage? {
        let url = URL(string: urlStr)!
        let ret = try? await URLSession.shared.data(from: url)
        print("Download Done")
        
        if let data = ret?.0 {
            let image = UIImage(data: data)
            return image
        }
        
        return nil
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Slider(value: $value) {
                Text("value : \(value)")
            }
            HStack(spacing: 20) {
                Button("Sync") {
                    image = nil
                    let downloaded = syncDownloadImage()
                    image = downloaded
                }
                
                Button("GCD") {
                    image = nil
                    gcdDownloadImage { downloaded in
                        self.image = downloaded
                    }
                }
                
                Button("URLSession") {
                    image = nil
                    sessionBasedTask { downloaded in
                        self.image = downloaded
                    }
                }
                
                Button("AsyncAwait") {
                    image = nil
                    Task {
                        let downloaded = await awaitBasedTask()
                        self.image = downloaded
                    }
                }
            }
            Divider()
            VStack {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
