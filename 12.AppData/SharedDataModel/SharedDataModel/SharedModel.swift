//
//  SharedModel.swift
//  PropertyWrappers
//

import SwiftUI

// class만 가능
class SharedModel: ObservableObject {
    @Published var sharedValue = 0
    
    func increase() {
        sharedValue += 1
    }
    
    // 1초뒤 1증가
    func asyncIncrese() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.sharedValue += 1
        }
    }
}
