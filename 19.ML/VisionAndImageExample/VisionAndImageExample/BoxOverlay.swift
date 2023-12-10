//
//  BoxOverlay.swift
//  VisionAndImageExample
//

import SwiftUI
import Vision

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
//                Rectangle()
//                    .fill(.clear)
//                    .border(.red, width: 1)
//                    .onChange(of: bounds, { oldValue, newValue in
//                        print("image adjusted size : \(width), \(height)")
//                        
//                        bounds.forEach { bound in
//                            let normalizedRect = VNImageRectForNormalizedRect(bound, Int(width), Int(height))
//                            print(bound, "[\(width * bound.minX),\(height * (1 - bound.maxY))]", "[\(normalizedRect.minX), \(normalizedRect.minY)]")
//                        }
//                    })
                                
                ForEach(Array(bounds.enumerated()), id: \.offset ) { index, bound in
                    
                    let boxWidth = width * ( bound.maxX - bound.minX )
                    let boxHeight = height * ( bound.maxY - bound.minY )
                    let boxX = width * bound.minX
                    let boxY = height * (1 - bound.maxY)

                    Rectangle()
                        .fill(.clear)
                        .border(.red, width: 1)
                        .frame(width: boxWidth, height: boxHeight)
                        .position(x: boxX + boxWidth / 2, y: boxY + boxHeight / 2)
                }
            }
            .frame(width: width, height: height)
            .position(x: x + width / 2, y: y + height / 2) // center
        }
    }
}

#Preview {
    BoxOverlay(bounds: [], imageSize: .zero)
}
