//
//  ContentView.swift
//  VariousShapes
//
//  Created by wannabewize on 1/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
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
            
            

            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
