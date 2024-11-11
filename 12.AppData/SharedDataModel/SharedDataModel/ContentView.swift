//
//  ContentView.swift
//  ObservableObserved
//

import SwiftUI

struct ContentView: View {
    @StateObject var provider = SharedModel()
        
    var body: some View {
        VStack(spacing: 40) {
            VStack(spacing: 20) {
                Text("StateObject value : \(provider.sharedValue)")
                
                HStack(spacing: 20) {
                    Button("+1(sync)") {
                        provider.increase()
                    }
                    .buttonStyle(.borderedProminent)
                    Button("+1(async)") {
                        provider.asyncIncrese()
                    }
                    .buttonStyle(.borderedProminent)
                }
                
                Text("Observed").font(.headline)

                ObservedObjectView(provider: provider)
                
                Text("EnvironmentObject").font(.headline)
                
                EnvironmentObjectView()
                    .environmentObject(provider)
                    
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 0.5)
            }
        }
        
        .padding()
        
    }
}

#Preview {
    ContentView()
}
