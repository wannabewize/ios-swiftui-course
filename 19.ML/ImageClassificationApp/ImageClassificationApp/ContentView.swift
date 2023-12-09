//
//  ContentView.swift
//  ImageClassificationApp
//

import SwiftUI
import PhotosUI
import Vision

struct ContentView: View {
    @State var selectedItem: PhotosPickerItem?
    @State var uiImage: UIImage?
    @State var resultStr: String?
    @State var bounds: [CGRect]?
    @State var imageSize: CGSize?
    
    var body: some View {
        ZStack {
            VStack {
                HStack(spacing: 12) {
                    PhotosPicker(selection: $selectedItem, matching: .images) {
                        Image(systemName: "photo")
                    }
                    
                    Button("Classify") {
                        classifyImage()
                    }
                    
                    Button("Rectange") {
                        detectRectangle()
                    }
                    
                    Spacer()
                }
                .frame(height: 60)
                Spacer()
            }
            
            ZStack {
                if let image = uiImage {
                    ZStack {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        if let bounds = bounds {
                            BoxOverlay(bounds: bounds, imageSize: image.size)
                        }
                    }
                }
                
                if let result = resultStr {
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(result)
                            .font(.caption)
                            .padding()
                            .background(.yellow)
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    }
                }
            }
            .padding(.top, 60)
            .compositingGroup()
        }
        .padding()
        .task(id: selectedItem, {
            if let loaded = try? await selectedItem?.loadTransferable(type: Data.self) {
                uiImage = UIImage(data: loaded)
            }
        })
        .onAppear {
            let visionRect = CGRect(x: 0.3, y: 0.4, width: 0.5, height: 0.4)
            let rio = CGRect(x: 0, y: 0, width: 600.0/3000.0, height: 400.0/4000.0)
            
            let ret1 = VNImageRectForNormalizedRect(visionRect, 3000, 4000)
            let ret2 = VNImageRectForNormalizedRectUsingRegionOfInterest(visionRect, 3000, 4000, rio)
            
            print(visionRect, "->", ret1, ret2)
        }
        
    }
    
    func classifyImage() {
        guard let cgImage = uiImage?.cgImage else {
            return
        }
        let request = VNClassifyImageRequest()
        let handler = VNImageRequestHandler(cgImage: cgImage)
        do {
            try handler.perform([request])
        }
        catch {
            // 시뮬레이터 동작 안함
            print("Error ", error)
            resultStr = "ERROR!\n\(error.localizedDescription)"
            return
        }
        
        if let observations: [VNClassificationObservation] = request.results {
            let mapped = observations
                .filter { item in
                    item.confidence > 0.5
                }
                .sorted { lhs, rhs in
                    lhs.confidence > rhs.confidence
                }
                .map { item in
                    "\(item.identifier)(\(item.confidence))"
                }
            print("mapped :", mapped)
            resultStr = mapped.joined(separator: "\n")
        }
    }
    
    
    func detectRectangle() {
        guard let cgImage = uiImage?.cgImage else {
            return
        }
        
        let request = VNDetectRectanglesRequest { request, error in
            print("rectangle completed")
        }
        request.minimumConfidence = 0.5
        request.maximumObservations = 10
        
        let handler = VNImageRequestHandler(cgImage: cgImage)
        do {
            try handler.perform([request])
            
            // [VNRectangleObservation]
            if let observations = request.results, observations.count > 0 {
                bounds = observations.map({ item in
                    item.boundingBox
                })
                
                let result = observations.map { item in
//                    let convertedRect = VNImageRectForNormalizedRect(item.boundingBox, uiImage?.size.width, uiImage?.size.height)
                    let normalizedRect = VNImageRectForNormalizedRect(item.boundingBox, Int(uiImage!.size.width), Int(uiImage!.size.height))
                    print(item.boundingBox, normalizedRect)
                    return "[\(item.topLeft) - \(item.bottomRight)] \(item.confidence)"
                }
                resultStr = result.joined(separator: "\n")
            }
            else {
                bounds = nil
                resultStr = "zero retangle found"
            }
        }
        catch {
            print("Error")
        }
    }
}

#Preview {
    ContentView()
}
