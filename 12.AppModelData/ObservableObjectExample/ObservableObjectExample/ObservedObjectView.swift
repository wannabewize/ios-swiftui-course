//
//  ObservedObjectView.swift
//  EnvironmentExample
//


import SwiftUI

struct ObservedObjectView: View {
    @ObservedObject var counter: Counter
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Child View with ObservedObject")
                .font(.headline)
            
            Text("value : \(counter.value)")
            HStack {
                Button("+1") {
                    counter.increase()
                }
                .buttonStyle(.borderedProminent)
                Button("+1(async)") {
                    counter.increaseAsync()
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}
