//
//  ContentView.swift
//  DataFlow
//

import SwiftUI

struct ContentView: View {
    @State var value1 = 0
    @State var myStruct1 = MyStruct(value: 0)
    
    @State var value2 = 0
    @State var myStruct2 = MyStruct(value: 0)
    
    var body: some View {
        VStack {
            HStack {
                Text("단방향 데이터 흐름")
                    .font(.title2)
            }
            VStack {
                HStack {
                    Text("부모 뷰").font(.headline)
                    Button("+") {
                        value1 += 1
                        myStruct1.increse()
                    }
                }

                HStack(spacing: 20) {
                    Text("\(value1)")
                    Text("\(myStruct1.value)")
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .border(.gray, width: 0.5)
            
            VStack {
                Text("자식 뷰").font(.headline)
                ReadOnlyView(value: value1, myStruct: myStruct1)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .border(.gray, width: 0.5)
            
            
            Text("양방향 데이터 흐름")
                .font(.title2)
                .padding(.top, 30)
            VStack {
                HStack {
                    Text("부모 뷰").font(.headline)
                    Button("+") {
                        value2 += 1
                        myStruct2.increse()
                    }
                }

                HStack {
                    Text("\(value2)")
                    Text("\(myStruct2.value)")
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .border(.gray, width: 0.5)

            VStack {
                EditableView(value: $value2, myStruct: $myStruct2)

            }
            .padding()
            .frame(maxWidth: .infinity)
            .border(.gray, width: 0.5)
            
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
