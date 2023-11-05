//
//  EnvironmentObjectView.swift
//  PropertyWrappers
//

import SwiftUI

struct EnvironmentObjectView: View {
    @EnvironmentObject var provider: SharedModel
    
    var body: some View {
        HStack {
            Text("EnvironmentObject - value")
            Spacer()
            Text("\(provider.sharedValue)")
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
        EnvironmentObjectView()
            .environmentObject(provider)
}
