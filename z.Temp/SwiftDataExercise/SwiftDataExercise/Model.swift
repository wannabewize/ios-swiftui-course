//
//  Model.swift
//  SwiftDataExercise
//
//  Created by wannabewize on 12/2/23.
//

import Foundation
import SwiftData

@Model
class Item {
    var value: Int
    
    init(value: Int) {
        self.value = value
    }
}
