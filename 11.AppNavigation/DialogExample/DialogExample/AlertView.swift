//
//  AlertView.swift
//  DialogExample
//
//  Created by Jaehoon Lee on 11/7/24.
//

import SwiftUI

struct AlertView: View {
    @State var isAlertVisible = false
    @State var isManyButtonAlertVisible = false
    @State var isButtonRoleAlertVisible = false
    @State var isTextInputAlertVisible = false
    @State var isManyTextFieldAlertVisible = false
    @State var isNoActionAlertVisible = false
    @State var textInput: String = ""
    
    @State var isLoginAlertVisible = false
    @State var userId: String = ""
    @State var userPw: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Alerts") {
                isAlertVisible = true
            }
            .alert("Alert Title", isPresented: $isAlertVisible) {
                // Binding으로 인해서 alert가 사라질 때 자동으로 false로 변경됨. 수동으로 false 변경 불필요
                Button("Confirm") { print("Confirm selected.") }
                Button("Cancel") { print("Cancel selected.") }
            } message: {
                Text("Alert Message")
            }
            
            Button("Three Button Alert") {
                isManyButtonAlertVisible = true
            }
            .alert("Alert with many buttons", isPresented: $isManyButtonAlertVisible) {
                Button("One") { print("One selected")}
                Button("Two") { print("Two selected")}
                Button("Three") { print("One selected")}
                Button("Four") { print("Four selected")}
            }
            
            Button("Action roles") {
                isButtonRoleAlertVisible = true
            }
            .alert("Button roles", isPresented: $isButtonRoleAlertVisible) {
                Button("Default") { print("default button selected") }
                Button("Cancel", role: .cancel) { print("cancel button selected") }
                Button("Destructive", role: .destructive) { print("destructive button selected") }
            }
            
            Button("Text Input") {
                isTextInputAlertVisible = true
            }
            .alert("Text Input Dialog", isPresented: $isTextInputAlertVisible) {
                TextField("User Input", text: $textInput)
                // need to make textField clear
                Button("Cancel", role: .cancel) {
                    textInput = ""
                    print("cancel selected")
                }
                Button("OK") {
                    textInput = ""
                    print("User Input : \(textInput)")
                }
            }
            
            Button("Loggin Alert") {
                isLoginAlertVisible = true
            }
            .alert("Login Dialog", isPresented: $isLoginAlertVisible) {
                Button("Cancel", role: .cancel) { print("cancel selected") }
                Button("OK") { print("User Input : \(userId), \(userPw)") }
                TextField("userId", text: $userId, prompt: Text("user id"))
                    .textInputAutocapitalization(.never)
                SecureField("password", text: $userPw, prompt: Text("password") )
            } message: {
                Text("Input user id and pw")
            }
            
            Button("Many TextField Alert") {
                isManyTextFieldAlertVisible = true
            }
            .alert("Many TextField Dialog", isPresented: $isManyTextFieldAlertVisible) {
                // if textfield is not cleared,
                Button("Cancel", role: .cancel) { print("cancel selected") }
                Button("OK") { print("User Input : \(userId), \(userPw)") }
                TextField("Input1", text: $textInput)
                TextField("Input2", text: $textInput)
                TextField("Input3", text: $textInput)
                TextField("Input4", text: $textInput)
            } message: {
                Text("Many TextField")
            }
            
            Button("No Action Alert") {
                isNoActionAlertVisible = true
            }
            .alert("No Actions", isPresented: $isNoActionAlertVisible) {                
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    AlertView()
}
