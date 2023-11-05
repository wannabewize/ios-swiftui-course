//
//  SharedModel.swift
//  PropertyWrappers
//

import SwiftUI

// class만 가능
class SharedModel: ObservableObject {
    @Published var sharedValue = 0
        
    // sharing same business login
    func asyncIncOne() {
        // 1초뒤 실행
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.sharedValue += 1
        }
    }
}

class SharedModel2: ObservableObject {
    @Published var sharedText: String
    
    init(sharedText: String) {
        self.sharedText = sharedText
    }
    
}
