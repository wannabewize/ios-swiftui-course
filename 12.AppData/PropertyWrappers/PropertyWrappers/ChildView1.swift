//
//  BindingView.swift
//  PropertyWrappers
//

import SwiftUI

struct ChildView1: View {
    @Binding var childValue: Int
    var body: some View {
        VStack {
            Stepper("ChildView1 : \(childValue)", value: $childValue)
        }
    }
}

#Preview {
    ChildView1(childValue: .constant(10))
}
