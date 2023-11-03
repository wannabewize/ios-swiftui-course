//
//  ContentView.swift
//  PropertyWrappers
//

import SwiftUI

// class만 가능
class SharedModel: ObservableObject {
    @Published var sharedValue = 0
        
    func asyncIncOne() {
        // sharing same business login
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.sharedValue += 1
        }
    }
}

struct ContentView: View {
    @State var parentValue = 0
    @StateObject var provider = SharedModel()
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Property Wrapper")
                .font(.title)
            VStack {
                Text("State")
                    .font(.headline)
                StateView()
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 0.5)
                    }
            }
            
            VStack {
                Text("Binding - parent value \(parentValue)")
                    .font(.headline)
                BindingView(childValue: $parentValue)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 0.5)
                    }
            }
            
            VStack {
                HStack {
                    Text("Observable").font(.headline)
                    Button(action: {
                        provider.asyncIncOne()
                    }, label: {
                        Image(systemName: "plus.circle")
                    })
                    .padding(.leading, 10)
                }
                ObservedObjectView(provider: provider)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 0.5)
                    }
            }
            
            VStack {
                HStack {
                    Text("EnvironmentObject").font(.headline)
                    Button(action: {
                        provider.asyncIncOne()
                    }, label: {
                        Image(systemName: "plus.circle")
                    })
                    .padding(.leading, 10)
                }

                EnvironmentObjectView()
                    .environmentObject(provider)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 0.5)
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
