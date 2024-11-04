//
//  ContentView.swift
//  GridAndGridItemExample
//
//  Created by wannabewize on 11/5/24.
//

import SwiftUI

struct GridItemView: View {
    var id: Int
    var color: Color
    
    init(id: Int, color: Color) {
        self.id = id
        self.color = color
        print("GridItemView \(id) initialized")
    }
    
    var body: some View {
        Text("Item \(id)")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(color)
    }
}

extension Color {
    static var random: Color {
        let r = Double.random(in: 0.0...1.0)
        let g = Double.random(in: 0.0...1.0)
        let b = Double.random(in: 0.0...1.0)
        return Color(red: r, green: g, blue: b)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            
            Text("Initialize at once")
                .font(.headline)

            ScrollView {
                Grid {
                    ForEach(0..<20, id: \.self) { number in
                        GridItemView(id: number, color: Color.random)
                            .frame(height: 100)
                    }
                }
            }
            .frame(height: 200)
            .border(.black, width: 2)
            
            Text("Initialize when needed")
                .font(.headline)
            
            Text("Vertical Grid")
                .font(.subheadline)
            
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]) {
                    ForEach(100..<200, id: \.self) { number in
                        GridItemView(id: number, color: Color.random)
                            .frame(height: 50)
                    }
                        
                }
            }
            .frame(height: 200)
            .border(.black, width: 2)
            
            Text("Horizontal Grid")
                .font(.subheadline)
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 10) {
                    ForEach(200..<300, id: \.self) { number in
                        GridItemView(id: number, color: Color.random)
                    }
                }
            }
            .frame(height: 200)
            .border(.black, width: 2)

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
