//
//  DetailView.swift
//  BasicNavigation
//
//  Created by wannabewize on 10/29/23.
//

import SwiftUI

struct DetailView: View {
    @Binding var navPath: NavigationPath
    
    var passedValue: Int
    
    var body: some View {
        VStack {
            Text("전달된 값 : \(passedValue)")
            
            Button("뒤로가기") {
                // navigationDestination 으로 이동한 경우 동작
                if !navPath.isEmpty {
                    navPath.removeLast()
                }
            }
        }
    }
}

#Preview {
    @State var path = NavigationPath(["a"])
    return
        DetailView(navPath: $path, passedValue: 100)

}
