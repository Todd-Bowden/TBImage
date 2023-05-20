//
//  CGImage+fillColor.swift
//  
//
//  Created by Todd Bowden on 5/20/23.
//

import Foundation
import CoreGraphics

public extension CGImage {
    
    static func fill(color: CGColor, width: Int, height: Int) throws -> CGImage {
        let bitmapInfoRawValue = CGBitmapInfo.byteOrder32Big.rawValue | CGImageAlphaInfo.premultipliedLast.rawValue
        let bitmapInfo = CGBitmapInfo(rawValue: bitmapInfoRawValue)
        
        let context = CGContext(data: nil,
                                width: width,
                                height: height,
                                bitsPerComponent: 8,
                                bytesPerRow: width*4,
                                space: CGColorSpaceCreateDeviceRGB(),
                                bitmapInfo: bitmapInfo.rawValue)
        guard let context else {
            throw TBImageError.errorCreatingCGContext
        }
        context.setFillColor(color)
        context.fill(CGRect(x: 0, y: 0, width: width, height: height))
        guard let cgImage = context.makeImage() else {
            throw TBImageError.errorCreatingCGImage
        }
        return cgImage
    }
    
}
