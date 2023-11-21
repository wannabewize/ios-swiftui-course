//
//  ThirdView.swift
//  Trigger
//
//  Created by wannabewize on 11/20/23.
//

import SwiftUI

struct ThirdView: View {
    @State var keyword: String = ""
    var body: some View {
        VStack {
            Text("Third View - Second Tab")
                .font(.headline)
            
            TextField("search keyword", text: $keyword)
                .onSubmit() {
                    print("Enter!")
                }
        }
        .onChange(of: keyword) { oldValue, newValue in
            print("keyword changed", keyword)
        }
    }
}

#Preview {
    ThirdView()
}
