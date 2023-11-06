//
//  ObservableView.swift
//  PropertyWrappers
//

import SwiftUI

struct ObservedObjectView: View {
    @ObservedObject var provider: SharedModel
    
    var body: some View {
        HStack {
            Text("Observed Object value : \(provider.sharedValue)")
            Spacer()
            Button(action: {
                provider.asyncIncOne()
            }, label: {
                Image(systemName: "plus.circle")
            })
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
