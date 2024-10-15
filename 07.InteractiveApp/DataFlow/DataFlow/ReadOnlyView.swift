//
//  ReadOnlyView.swift
//  DataFlow
//

import SwiftUI

struct ReadOnlyView: View {
    var value: Int
    var myStruct: MyStruct
    
    var body: some View {
        HStack(spacing: 20) {
            Text("\(value)")
            Text("\(myStruct.value)")
        }
    }
}

#Preview {
    ReadOnlyView(value: 10, myStruct: MyStruct(value: 20))
}
