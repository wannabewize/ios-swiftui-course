//
//  ModalView.swift
//  Modal
//
//  Created by wannabewize on 1/22/24.
//

import SwiftUI

struct ModalView:View {
    @Environment(\.isPresented) var isPresented
    @Environment(\.dismiss) var dismiss
    
    var data: String
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                Text("Modal View")
                    .font(.headline)
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        // 모달 닫기
                        dismiss()
                    }, label: {
                        Text("Close")
                    })
                    .buttonStyle(.borderedProminent)
                    .padding(.trailing, 8)
                }
            }
            .padding(.top, 10)
            
            Divider()
            
            Spacer()
            
            Text(data)
                .font(.title)
            
            Text("모달 출력? \(isPresented)")
            
            Spacer()
        }        
    }
}

#Preview {
    ModalView(data: "Hello")
}
