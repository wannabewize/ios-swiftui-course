//
//  BoxOverlay.swift
//  ImageClassificationApp
//
//  Created by Jaehoon Lee on 12/9/23.
//

import SwiftUI
import Vision

struct OneBoxOverlay: View {
    var bounds: CGRect
    
    var body: some View {
        Path { path in
            path.addRect(
                CGRect(
                    x: bounds.minX,
                    y: bounds.minY,
                    width: bounds.width,
                    height: bounds.height
                )
            )
        }
        .stroke(lineWidth: 1)
    }
}

struct BoxOverlay: View {
    var bounds: [CGRect]
    var imageSize: CGSize
    
    var body: some View {
        GeometryReader { geometry in
            let ratio = imageSize.width / imageSize.height
            let width = min(geometry.size.width, geometry.size.height * ratio)
            let height = width / ratio
            let x = (geometry.size.width - width) / 2
            let y = (geometry.size.height - height) / 2

            ZStack {
                ForEach(0..<bounds.count) { i in
                    let adjusted = VNImageRectForNormalizedRectUsingRegionOfInterest(bounds[i], Int(imageSize.width), Int(imageSize.height), CGRect(x:0, y: 0, width: width, height: height))
                    //VNNormalizedRectForImageRect(bounds[i], Int(width), Int(height))
                    //VNImageRectForNormalizedRect(bounds[i], Int(width), Int(height))
                    OneBoxOverlay(bounds: adjusted)
                }
            }
            .frame(width: width, height: height)
            .position(x: x + width / 2, y: y + height / 2)
        }
    }
}

#Preview {
    BoxOverlay(bounds: [], imageSize: .zero)
}
