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
        let width = Int(path.boundingBox.width.ceil)
        let height = Int(path.boundingBox.height.ceil)
        let context = try CGContext.grayContext(width: width, height: height)
        context.addPath(path)
        context.setFillColor(gray: gray, alpha: 1)
        context.fillPath()
        return try context.image()
    }
    
}

private extension CGFloat {
    var ceil: CGFloat {
        Darwin.ceil(self)
    }
}

