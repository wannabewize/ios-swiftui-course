//
//  DetailView.swift
//  BasicNavigation
//
//  Created by wannabewize on 10/29/23.
//

import SwiftUI

struct DetailView: View {
    var passedValue: Int
    
    var body: some View {
        VStack {
            Text("전달된 값 : \(passedValue)")
        }
        .navigationTitle("Detail View")
    }
}

#Preview {
    DetailView(passedValue: 100)

}
