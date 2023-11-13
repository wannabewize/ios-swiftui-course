//
//  ContentView.swift
//  JSONandApp
//
//  Created by wannabewize on 11/13/23.
//

import SwiftUI

struct ContentView: View {
    @State var data: [LanguageInfo] = []
    var body: some View {
        VStack {
            List {
                ForEach(data, id: \.name) { item in
                    HStack {
                        Image(item.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.lastVersion)
                                .font(.caption)
                            Text("since \(item.release)")
                                .font(.caption)
                        }
                        
                    }
                }
            }
        }
        .padding()
        .onAppear {
            if let data = fetchData() {
                self.data = data
            }
        }
    }
}

#Preview {
    ContentView()
}
