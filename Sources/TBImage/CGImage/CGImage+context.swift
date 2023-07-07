//
//  CGImage+context.swift
//
//
//  Created by Todd Bowden on 7/7/23.
//

import Foundation
import CoreGraphics

public extension CGImage {
    
    func context(width: Int? = nil, height: Int? = nil) throws -> CGContext {
        guard let colorSpace = self.colorSpace else {
            throw TBImageError.errorCreatingCGContext
        }
        let width = width ?? self.width
        let height = height ?? self.height
        if colorSpace.numberOfComponents == 1 {
            return try CGContext.grayContext(width: width, height: height)
        } else {
            return try CGContext.rgbaContext(width: width, height: height)
        }
    }
    
}
