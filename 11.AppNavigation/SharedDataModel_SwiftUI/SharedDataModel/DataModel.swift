//
//  DataModel.swift
//  ObservableObserved
//

import Foundation

class DataModel: ObservableObject {
    @Published var sharedValue: Float = 0
    
    let minimum: Float = 0
    let maximum: Float = 10
        
    func decrease() {
        sharedValue -= 1
    }
    
    func increase() {
        sharedValue += 1
    }
}

