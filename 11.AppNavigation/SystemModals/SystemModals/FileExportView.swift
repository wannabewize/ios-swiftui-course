//
//  ContactPickerView.swift
//  SystemModals
//
//  Created by Jaehoon Lee on 11/10/24.
//

import SwiftUI
import Contacts
import ContactsUI

struct FileExportView: View {
    @State var text = ""
    @State var isExportDialogVisible = false
    @State var isImportDialogVisible = false
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("Import") {
                    isImportDialogVisible = true
                }

                Button("Export") {
                    isExportDialogVisible = true
                }
            }
            TextEditor(text: $text)
                .border(.gray, width: 0.7)
        }
        .padding()
        
        .fileExporter(isPresented: $isExportDialogVisible, item: text) { result in
            switch result {
            case .success(let url):
                print("export success", url)
                text = ""
            case .failure(let error):
                print("error :", error)
            }
        }
        .fileImporter(isPresented: $isImportDialogVisible, allowedContentTypes: [.text], onCompletion: { result in
            switch result {
            case .success(let url):
                print("import success ", url)
                if let data = try? Data(contentsOf: url),
                   let imported = String(data: data, encoding: .utf8) {
                    text = imported
                }
                else {
                    print("error :")
                }

            case .failure(let error):
                print("Error", error)
            }
        })
    }
}

#Preview {
    FileExportView()
}
