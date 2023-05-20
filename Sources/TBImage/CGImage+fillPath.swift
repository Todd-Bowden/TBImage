//
//  CGImage+fillPath.swift
//  
//
//  Created by Todd Bowden on 5/7/23.
//

import Foundation
import CoreGraphics

public extension CGImage {
    
    static func fill(path: CGPath, gray: CGFloat = 1) throws -> CGImage {
        let context = CGContext(
            data: nil,
            width: Int(path.boundingBox.width.ceil),
            height: Int(path.boundingBox.height.ceil),
            bitsPerComponent: 8,
            bytesPerRow: 0,
            space: CGColorSpaceCreateDeviceGray(),
            bitmapInfo: 0
        )
        guard let context else {
            throw TBImageError.errorCreatingCGContext
        }
        context.addPath(path)
        context.setFillColor(gray: gray, alpha: 1)
        context.fillPath()
        guard let cgImage = context.makeImage() else {
            throw TBImageError.errorCreatingCGImage
        }
        return cgImage
    }
    
}

private extension CGFloat {
    var ceil: CGFloat {
        Darwin.ceil(self)
    }
}

