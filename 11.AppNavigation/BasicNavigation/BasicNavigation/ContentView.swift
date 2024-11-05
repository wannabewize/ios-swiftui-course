//
//  ContentView.swift
//  BasicNavigation
//
//  Created by wannabewize on 10/29/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack() {
            VStack(spacing: 20) {
                
                Text("NavigationLink와 Destination")
                    .font(.headline)
                
                NavigationLink("Detail View 이동, 1 전달") {
                    DetailView(passedValue: 1)
                }
                
                NavigationLink {
                    DetailView(passedValue: 2)
                } label: {
                    HStack {
                        Text("Detail View 이동, 2 전달")
                        Image(systemName: "chevron.right")
                    }
                }

                Text("NavigationLink와 navigationDestination")
                    .font(.headline)
                
                // navigationDestination과 연결 Int.self
                NavigationLink(value: 100) {
                    Text("Detail View 이동, 100 전달, Int Type")
                }
                NavigationLink(value: 101) {
                    Text("Detail View 이동, 101 전달, Int Type")
                }
                // 대응하는 navigationDestination이 없으므로 동작 없음
                NavigationLink(value: "111") {
                    Text("Detail View 이동, 111 전달, String Type")
                }
                NavigationLink(value: "112") {
                    Text("Detail View 이동, 112 전달, String Type")
                }
                
                // Double Type
                NavigationLink(value: 0.1) {
                    Text("Detail View 이동, 0.1 전달, Double Type")
                }
            }
            // value가 Int 타입인 NavigationLink와 동작
            .navigationDestination(for: Int.self, destination: { item in
                DetailView(passedValue: item)
            })
            .navigationDestination(for: String.self, destination: { item in
                if let value = Int(item) {
                    DetailView(passedValue: value)
                }
                else {
                    Text("Error")
                }
            })
            .padding(.horizontal, 40)
            // 내비게이션 바 - 뷰 이름
            .navigationTitle("Main View")
            // 인라인 모드. 작은 이름 사용
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
