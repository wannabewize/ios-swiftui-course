//
//  ControllerView.swift
//  SharedDataModel
//

import SwiftUI

struct ControllerView: View {
    @EnvironmentObject var model: SharedModel
    
    var body: some View {
        HStack(spacing: 20) {
            Button("+1") {
                model.increase()
            }
            .buttonStyle(.bordered)

            Button("+1(async)") {
                model.asyncIncrese()
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    ControllerView()
}
