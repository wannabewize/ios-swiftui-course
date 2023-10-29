//
//  ContentView.swift
//  ObservableObserved
//

import SwiftUI

struct ContentView: View {
    @StateObject var dataModel = DataModel()
    
    var body: some View {
        VStack(spacing: 40) {
            OtherView1(model: dataModel)
            
            OtherView2()
                .environmentObject(dataModel)
            
            Slider(value: $dataModel.sharedValue, in: 0...10, step: 1)
            
            ControllerView()
                .environmentObject(dataModel)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
