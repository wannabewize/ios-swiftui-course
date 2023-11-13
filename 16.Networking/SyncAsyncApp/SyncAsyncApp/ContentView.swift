//
//  ContentView.swift
//  SyncAsyncApp
//
//  Created by wannabewize on 11/13/23.
//

import SwiftUI

struct ContentView: View {
    @State var image: UIImage?
    @State var value: Float = 0.5
    
    // 4mb image
    let urlStr = "https://upload.wikimedia.org/wikipedia/commons/f/f4/The_Scream.jpg"

    
    var body: some View {
        VStack(spacing: 20) {
            Slider(value: $value) {
                Text("value : \(value)")
            }
            HStack(spacing: 20) {
                Button("Sync") {
                    image = nil
                    let downloaded = syncDownloadImage(urlStr)
                    image = downloaded
                }
                
                Button("GCD") {
                    image = nil
                    gcdDownloadImage(urlStr) { downloaded in
                        self.image = downloaded
                    }
                }
                
                Button("URLSession") {
                    image = nil
                    sessionBasedTask(urlStr) { downloaded in
                        self.image = downloaded
                    }
                }
                
                Button("AsyncAwait") {
                    image = nil
                    Task {
                        let downloaded = await awaitBasedTask(urlStr)
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
