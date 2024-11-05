//
//  SubView.swift
//  NavigationPathExample
//
//  Created by wannabewize on 11/6/24.
//
import SwiftUI

struct SubView: View {
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Stack Count : \(navigationPath.count)")
            Button("NavigationPath를 이용해서 뒤로가기") {
                if !navigationPath.isEmpty {
                    navigationPath.removeLast()
                }
            }
            
            Button("navigationDestination을 이용해서 SubView로 이동") {
                navigationPath.append(1)
            }
            
            NavigationLink("NavigationLink의 destination으로 SubView로 이동") {
                SubView(navigationPath: $navigationPath)
            }
        }
        .navigationDestination(for: Int.self, destination: { value in
            SubView(navigationPath: $navigationPath)
        })
        .navigationTitle("SubView")
    }
}

#Preview {
    SubView(navigationPath: .constant(NavigationPath()))
}
