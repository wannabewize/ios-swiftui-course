//
//  ContentView.swift
//  VariousShapes
//
//  Created by wannabewize on 1/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Circle by Clip")
                    .frame(width: 100, height: 100)
                    .background(.blue)
                    .clipShape(Circle())
                    .foregroundStyle(.white)

                Text("Rounded Rectange")
                    .frame(width: 100, height: 100)
                    .background(.blue)
                    .clipShape(
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 10), style: .continuous), style: FillStyle())
                
                Text("Border")
                    .frame(width: 100, height: 100)
                    .border(Color.black, width: 1)
                
                Text("Shadow")
                    .frame(width: 100, height: 100)
                    .background(.blue)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                Text("Uneven Rounded")
                    .frame(width: 100, height: 100)
                    .background(.blue)
                    .clipShape(
                        UnevenRoundedRectangle(topLeadingRadius: 10, bottomLeadingRadius: 10)
                    )
                
                Text("Uneven Rounded Border")
                    .frame(width: 100, height: 100)
                    .overlay {
                        UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(bottomTrailing: 10, topTrailing: 10), style: .continuous)
                            .stroke(lineWidth: 1)
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
