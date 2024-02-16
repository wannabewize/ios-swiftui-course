//
//  SubViews.swift
//  DataFlow
//

import SwiftUI

struct EditableView: View {
    @Binding var value: Int
    @Binding var myStruct: MyStruct
    
    var body: some View {
        VStack {
            HStack {
                Text("자식 뷰").font(.headline)
                Button("+") {
                    value += 1
                    myStruct.increse()
                }
            }
            HStack {
                Text("\(value)")
                Text("\(myStruct.value)")

            }
        }
    }
}

#Preview {
    EditableView(value: .constant(10), myStruct: .constant(MyStruct(value: 20)))
}
