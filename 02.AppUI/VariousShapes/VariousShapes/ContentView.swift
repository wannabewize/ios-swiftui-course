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
            VStack(spacing: 20) {
                HStack {
                    Text("Circle by Clip")
                        .frame(width: 100, height: 100)
                        .background(.blue)
                        .clipShape(Circle())
                        .foregroundStyle(.white)
                    
                    Text("Circle by background")
                        .frame(width: 100, height: 100)
                        .foregroundStyle(.white)
                        .background {
                            Circle()
                                .fill(.blue)
                        }
                    Text("Hidden")
                        .frame(width: 100, height: 100)
                        .overlay {
                            Circle()
                                .fill(.blue)
                        }
                        .overlay {
                            Text("Overlay")
                                .foregroundStyle(.white)
                        }
                }
                
                HStack {
                    Text("Rounded by Clip")
                        .frame(width: 100, height: 100)
                        .background(.blue)
                        .clipShape(
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 10), style: .continuous), style: FillStyle())
                    
                    Text("Rounded by Background")
                        .frame(width: 100, height: 100)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue)
                        )
                    
                }
                
                HStack {
                    Text("Border")
                        .frame(width: 100, height: 100)
                        .background(.blue)
                        .border(Color.black, width: 3)

                    Text("Border w/o background")
                        .frame(width: 100, height: 100)
                        .border(Color.black, width: 3)
                }
                
                HStack {
                    Text("Rounded Border with Background")
                        .frame(width: 100, height: 100)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                        }
                    
                    Text("Rounded Border with Overlay")
                        .frame(width: 100, height: 100)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                        }
                    
                    Text("Rounded Border with Clip&Overlay")
                        .frame(width: 100, height: 100)
                        .background(.blue)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 10)
                        )
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1.0)
                        }
                }


                HStack {
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

                
                Text("Hidden")
                    .frame(width: 100, height: 100)
                    .background(.blue)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.yellow)
                            .padding(5)
                    }
                    .overlay {
                        Circle()
                            .fill(.red)
                            .padding(10)
                    }
                    .overlay {
                        Text("Overlays")
                            .font(.headline)
                    }
                
                Text("Shadow")
                    .frame(width: 100, height: 100)
                    .background(.blue)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                
            }
        }
    }
}

#Preview {
    ContentView()
}
