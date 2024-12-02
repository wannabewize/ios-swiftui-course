//
//  Item.swift
//  SwiftDataApp
//

import Foundation
import SwiftData

@Model
final class Todo {
    var title: String
    var dueDate: Date
    
    init(title: String, dueDate: Date) {
        self.title = title
        self.dueDate = dueDate
    }
}
