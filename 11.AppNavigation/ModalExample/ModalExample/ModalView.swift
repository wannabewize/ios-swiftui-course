//
//  ModalView.swift
//  Modal
//
//  Created by wannabewize on 1/22/24.
//

import SwiftUI

struct ModalView:View {
    @Environment(\.isPresented) var isPrented
    @Environment(\.dismiss) var dismiss
    
    var data: String
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                Text("Modal View")
                    .font(.title)
                
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
            
            Spacer()
        }        
    }
}

#Preview {
    ModalView(data: "Hello")
}
