//
//  ContentView.swift
//  PropertyWrappers
//

import SwiftUI

struct ContentView: View {
    @State var parentValue = 0
    
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
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 0.5)
            }

            
            VStack(spacing: 20) {
                Text("Binding")
                    .font(.headline)
                HStack {
                    Stepper("Parent Value: \(parentValue)", value: $parentValue)
                }
                ChildView1(childValue: $parentValue)
                ChildView2(value: $parentValue)
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
