//
//  CGContext+new.swift
//
//
//  Created by Todd Bowden on 6/22/23.
//

import Foundation
import CoreGraphics

public extension CGContext {
    
    static func grayContext(width: Int, height: Int) throws -> CGContext {
        let context = CGContext(
            data: nil,
            width: width,
            height: height,
            bitsPerComponent: 8,
            bytesPerRow: width,
            space: CGColorSpaceCreateDeviceGray(),
            bitmapInfo: 0
        )
        guard let context else {
            throw TBImageError.errorCreatingCGContext
        }
        return context
    }
    
    static func rgbaContext(width: Int, height: Int) throws -> CGContext {
        let bitmapInfoRawValue = CGBitmapInfo.byteOrder32Big.rawValue | CGImageAlphaInfo.premultipliedLast.rawValue
        let bitmapInfo = CGBitmapInfo(rawValue: bitmapInfoRawValue)
        
        let context = CGContext(
                data: nil,
                width: width,
                height: height,
                bitsPerComponent: 8,
                bytesPerRow: width*4,
                space: CGColorSpaceCreateDeviceRGB(),
                bitmapInfo: bitmapInfo.rawValue)
        guard let context else {
            throw TBImageError.errorCreatingCGContext
        }
        return context
    }
    
}
