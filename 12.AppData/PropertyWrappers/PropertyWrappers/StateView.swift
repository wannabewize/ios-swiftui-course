//
//  StateView.swift
//  PropertyWrappers
//

import SwiftUI

struct StateView: View {
    @State var value = 0
    var body: some View {
        HStack {
            Stepper("Value : \(value)", value: $value)
        }
    }
}

#Preview {
    StateView()
}
