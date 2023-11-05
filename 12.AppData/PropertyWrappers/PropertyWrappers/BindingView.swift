//
//  BindingView.swift
//  PropertyWrappers
//

import SwiftUI

struct BindingView: View {
    @Binding var childValue: Int
    var body: some View {
        HStack {
            Stepper("ChildValue : \(childValue)", value: $childValue)
        }
    }
}

#Preview {
    @State var value = 0
    return
        BindingView(childValue: $value)
}
