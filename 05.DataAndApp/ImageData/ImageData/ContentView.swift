//
//  ContentView.swift
//  ImageData
//
//  Created by wannabewize on 10/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Image("tesla-model-3")
            
            Image("tesla-model-s")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 160)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
