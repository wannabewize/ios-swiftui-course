//
//  AnotherBindingView.swift
//  PropertyWrappers
//
//  Created by wannabewize on 11/12/24.
//

import SwiftUI

struct ChildView2: View {
    @Binding var value: Int
    
    var body: some View {
        VStack {
            Stepper(value: $value) {
                Text("ChildView2 : \(value)")
            }
        }
    }
}

#Preview {
    ChildView2(value: .constant(100))
}
