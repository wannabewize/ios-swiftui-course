//
//  Counter.swift
//  EnvironmentExample
//

import SwiftUI

class Counter: ObservableObject {
    @Published var value = 0
    
    init() {
        print("Counter instance initialized")
    }
    
    func increase() {
        value += 1
    }
    
    func increaseAsync() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.increase()
        }
    }
}
