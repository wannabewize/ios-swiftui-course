//
//  ContentView.swift
//  SimpleGridExample
//
//  Created by wannabewize on 11/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Grid {
                GridRow {
                    Text("a")
                }
                GridRow {
                    Text("가")
                    Text("나")
                }
                GridRow {
                    Text("1")
                    Text("2")
                    Text("3")
                }
            }
            .frame(maxWidth: .infinity)
            .border(.gray)
            
            Text("Grid with GridRow, Overflow, Clipped")
                .font(.subheadline)

            Grid {
                GridRow {
                    Rectangle()
                        .foregroundStyle(.red)
                    Rectangle()
                        .foregroundStyle(.green)
                    Rectangle()
                        .foregroundStyle(.blue)
                }
                .frame(height: 200)
                GridRow {
                    Rectangle()
                        .foregroundStyle(.green)
                    Rectangle()
                        .foregroundStyle(.blue)
                    Rectangle()
                        .foregroundStyle(.red)
                }
                .frame(height: 200)
                GridRow {
                    Rectangle()
                        .foregroundStyle(.blue)
                    Rectangle()
                        .foregroundStyle(.red)
                    Rectangle()
                        .foregroundStyle(.green)
                }
                .frame(height: 200)


            }
            .frame(height: 300)
            .clipped()
            .border(.black, width: 2)
            
            Text("Grid with ScrollView")
                .font(.subheadline)
            
            ScrollView {
                Grid {
                    GridRow {
                        Rectangle()
                            .foregroundStyle(.red)
                        Rectangle()
                            .foregroundStyle(.green)
                        Rectangle()
                            .foregroundStyle(.blue)
                    }
                    .frame(height: 200)
                    GridRow {
                        Rectangle()
                            .foregroundStyle(.green)
                        Rectangle()
                            .foregroundStyle(.blue)
                        Rectangle()
                            .foregroundStyle(.red)
                    }
                    .frame(height: 200)
                    GridRow {
                        Rectangle()
                            .foregroundStyle(.blue)
                        Rectangle()
                            .foregroundStyle(.red)
                        Rectangle()
                            .foregroundStyle(.green)
                    }
                    .frame(height: 200)
                }

            }
            .frame(height: 300)
            .border(.black, width: 2)
            
            
            Spacer()

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
