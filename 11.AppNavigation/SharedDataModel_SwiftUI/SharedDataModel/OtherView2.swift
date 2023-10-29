//
//  OtherView2.swift
//  ObservableObserved
//

import SwiftUI

struct OtherView2: View {
    @EnvironmentObject var model: DataModel
    
    var body: some View {
        VStack {
            Text("Shared data by Environment Object")
            Text("value : \(Int(model.sharedValue))")
        }
        
    }
}

#Preview {
    OtherView2()
        .environmentObject(DataModel())
}
