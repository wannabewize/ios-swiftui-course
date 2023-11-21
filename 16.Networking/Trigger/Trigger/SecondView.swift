//
//  SecondView.swift
//  Trigger
//
//  Created by wannabewize on 11/20/23.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        VStack {
            Text("Second View")
                .font(.headline)
                .onAppear {
                    print("Text in SecondView Appear")
                }
                .onDisappear {
                    print("Text in SecondView Disappear")
                }
        }
        .onAppear {
            print("Second View Appear")
        }
        .onDisappear {
            print("Second View Disappear")
        }
    }
}
#Preview {
    SecondView()
}
