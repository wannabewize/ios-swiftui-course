//
//  EnvironmentObjectView.swift
//  PropertyWrappers
//

import SwiftUI

struct ChildView: View {
    @EnvironmentObject var provider: SharedModel

    var body: some View {
        VStack {
            Text("ChildView value : \(provider.sharedValue)")
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
        }
    }
}

struct EnvironmentObjectView: View {
    @EnvironmentObject var provider: SharedModel
    
    var body: some View {
        VStack {
            Text("EnvironmentObject value : \(provider.sharedValue)")
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
            
            ChildView()
        }
    }
}

#Preview {
    @Previewable @State var provider = SharedModel()
    EnvironmentObjectView()
        .environmentObject(SharedModel())
        
}
