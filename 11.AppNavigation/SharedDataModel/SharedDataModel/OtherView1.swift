//
//  OtherView1.swift
//  ObservableObserved
//

import SwiftUI

struct OtherView1: View {
    @ObservedObject var model: DataModel
    
    var body: some View {
        VStack {
            Text("Shared data by Observed Object")
            Text("value : \(Int(model.sharedValue))")
        }
    }
}

#Preview {
    OtherView1(model: DataModel())
}
