//
//  PhotoPickerView.swift
//  SystemModals
//
//  Created by wannabewize on 11/8/24.
//

import SwiftUI
import PhotosUI

struct PhotoPickerView: View {
    @State var selectedPicture: PhotosPickerItem?
    
    @State var selectedImage: Image?
    var body: some View {
        VStack(spacing: 20) {
            
            PhotosPicker("Photo Picker", selection: $selectedPicture)
                .onChange(of: selectedPicture) { oldValue, newValue in
                    print("photo changed")
                    selectedPicture?.loadTransferable(type: Data.self, completionHandler: { result in
                        switch result {
                        case .success(let data):
                            if let data = data,
                                  let uiImage = UIImage(data: data) {
                                  selectedImage = Image(uiImage: uiImage)
                                  }
                            else {
                                print("success")
                            }
                        case .failure(let error):
                            print("Error :", error)
                        }
                    })
                }
            
            if let image = selectedImage {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            }
            else {
                Text("Image not loaded")
                    .padding(50)
                    .border(.gray, width: 0.7)
            }
            
            Spacer()
        }
        .padding()
    }}

#Preview {
    PhotoPickerView()
}
