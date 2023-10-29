//
//  ViewA.swift
//  TabBasedApp
//
//  Created by wannabewize on 10/30/23.
//

import SwiftUI

struct ViewA: View {
    var body: some View {
        Text("View A")
            .font(.title)
            .onAppear {
                print("View A Appear")
            }
            .onDisappear {
                print("View A Disappear")
            }
    }
}

struct ViewB: View {
    var body: some View {
        Text("View B")
            .font(.title)
            .onAppear {
                print("View B Appear")
            }
            .onDisappear {
                print("View B Disappear")
            }
    }
}

struct ViewC: View {
    var body: some View {
        Text("View C")
            .font(.title)
            .onAppear {
                print("View C Appear")
            }
            .onDisappear {
                print("View C Disappear")
            }
    }
}

#Preview {    
    ViewA()
}
