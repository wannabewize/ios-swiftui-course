//
//  ContentView.swift
//  NavigationBar
//
//  Created by wannabewize on 11/6/24.
//

import SwiftUI

struct SubView1: View {
    var body: some View {
        VStack {
            Text("Title inline, Right Button")
        }
        .navigationTitle("SubView1")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button("DoSome") {
                    print("action!")
                }
            }
        }
    }
}

struct SubView2: View {
    var body: some View {
        VStack {
            Text("Custom Color Toolbar with Two Buttons")
        }
        .navigationTitle("SubView2")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.red, for: .navigationBar)
        .toolbarBackgroundVisibility(.visible, for: .navigationBar)
        .toolbar {
            Group {
                ToolbarItem {
                    Button("Button1") {
                        print("button1")
                    }
                }
                ToolbarItem {
                    Button("Button2") {
                        print("button2")
                    }
                }
            }
        }
    }
    
}

struct SubView3: View {
    @Binding var path : NavigationPath
    @State var value: Float = 0.5
    
    var body: some View {
        VStack {
            Text("Back Button Hidden, Custom Left Button")
            
            Button("Back") {
                path.removeLast()
            }
        }
        .navigationBarBackButtonHidden()
        .navigationTitle("SubView3")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Custom") {
                    print("Do some")
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("trailing1") {
                    print("Do some")
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("trailing2") {
                    print("Do some")
                }
            }
        }
    }
}


struct ContentView: View {
    @State var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 20) {
                NavigationLink("SubView1") {
                    SubView1()
                }
                
                NavigationLink("SubView2") {
                    SubView2()
                }
                
                NavigationLink("SubView3", value: 1)
            }
            .navigationDestination(for: Int.self, destination: { value in
                SubView3(path: $path)
            })
            .navigationTitle("Main")
            .navigationBarTitleDisplayMode(.large)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
