//
//  ContentView.swift
//  PropertyWrappers
//

import SwiftUI

struct ContentView: View {
    @State var parentValue = 0
    @StateObject var provider = SharedModel()
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Property Wrapper")
                .font(.title)
            VStack(spacing: 20) {
                Text("State")
                    .font(.headline)
                StateView()
                    .padding()
            }
            .overlay {
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 0.5)
            }

            
            VStack(spacing: 20) {
                Text("Binding")
                    .font(.headline)
                HStack {
                    Stepper("Parent Value: \(parentValue)", value: $parentValue)
                }
                BindingView(childValue: $parentValue)
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 0.5)
            }

            
            VStack(spacing: 20) {
                
                Text("Observable").font(.headline)
                
                HStack {
                    Text("Observable - Published value : \(provider.sharedValue)")
                    Spacer()
                    Button(action: {
                        provider.asyncIncOne()
                    }, label: {
                        Image(systemName: "plus.circle")
                    })
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
                        
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
