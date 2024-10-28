//
//  ContentView.swift
//  BasicNavigation
//
//  Created by wannabewize on 10/29/23.
//

import SwiftUI

struct ContentView: View {
    @State var navPath = NavigationPath()
    
    @State var value: Float = 5
    var body: some View {
        NavigationStack(path: $navPath) {
            
            VStack(spacing: 20) {
                
                HStack {
                    Slider(value: $value, in: 1...10, step: 1)
                    Text("\(Int(value))")
                }
                // 텍스트 기반
                NavigationLink("이동") {
                    DetailView(navPath: $navPath, passedValue: Int(value))
                }
                
                NavigationLink {
                    DetailView(navPath: $navPath, passedValue: Int(value))
                } label: {
                    HStack {
                        Text("상세 뷰로 이동")
                        Image(systemName: "arrow.right")
                    }
                }
                
                // navigationDestination과 연결 Int.self
                NavigationLink(value: 111) {
                    Text("111")
                }
                NavigationLink(value: 222) {
                    Text("222")
                }
                // 대응하는 navigationDestination이 없으므로 동작 없음
                NavigationLink(value: "333") {
                    Text("333")
                }
            }
            // value가 Int 타입인 NavigationLink와 동작
            .navigationDestination(for: Int.self, destination: { item in
                DetailView(navPath: $navPath, passedValue: item)
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
