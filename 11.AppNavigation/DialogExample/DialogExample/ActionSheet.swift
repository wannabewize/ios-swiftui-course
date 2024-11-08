//
//  ActionSheet.swift
//  DialogExample
//
//  Created by Jaehoon Lee on 11/7/24.
//

import SwiftUI

struct ActionSheet: View {
    @State var isBasicActionSheetVisible = false
    @State var isBasicActionSheetVisible2 = false
    @State var isNoActionActionSheetVisible = false
    @State var userInput = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Action Sheet") {
                isBasicActionSheetVisible = true
            }
            .confirmationDialog("Action Sheet Title", isPresented: $isBasicActionSheetVisible) {
                Button("Cancel", role: .cancel) { print("cancel selected") }
                Button("Destructive", role: .destructive) { print("destruction action will fire")}
                Button("Option1") { print("option1 selected") }
                Button("Option2") { print("option2 selected") }
            } message: {
                Text("Action Sheet message")
            }
            
            // ActionSheet 에는 텍스트 입력 불가, destruction button 여러개
            Button("Action Sheet2") {
                isBasicActionSheetVisible2 = true
            }
            .confirmationDialog("Action Sheet with TextField", isPresented: $isBasicActionSheetVisible2) {
                TextField("Input", text: $userInput)
                Button("Cancel", role: .cancel) { print("cancel") }
                Button("OK") { print("cancel") }
                Button("Destructive1", role: .destructive) { print("destruction action-1 will fire")}
                Button("Destructive2", role: .destructive) { print("destruction action-2 will fire")}
            }
            
            Button("No Action") {
                isNoActionActionSheetVisible = true
            }
            .confirmationDialog("Action Sheet Title", isPresented: $isNoActionActionSheetVisible) {
                // No Action
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ActionSheet()
}
