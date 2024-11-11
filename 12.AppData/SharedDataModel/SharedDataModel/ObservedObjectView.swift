//
//  ObservableView.swift
//  PropertyWrappers
//

import SwiftUI

struct ObservedObjectView: View {
    @ObservedObject var provider: SharedModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Observed Object value : \(provider.sharedValue)")
            
            HStack(spacing: 20) {
                Button("+1(sync)") {
                    provider.asyncIncrese()
                }
                .buttonStyle(.borderedProminent)
                
                Button("+1(async)") {
                    provider.increase()
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    let provider = SharedModel()
    return
        HStack {
            ObservedObjectView(provider: provider)
        }
}
