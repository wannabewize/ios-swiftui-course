//
//  ControllerView.swift
//  SharedDataModel
//

import SwiftUI

struct ControllerView: View {
    @EnvironmentObject var model: DataModel
    
    var body: some View {
        HStack(spacing: 40) {
            Button("-1") {
                model.decrease()
            }
            .disabled(model.sharedValue <= model.minimum)
            
            Button("+1") {
                model.increase()
            }
            .disabled(model.sharedValue >= model.maximum)
        }
    }
}

#Preview {
    ControllerView()
}
