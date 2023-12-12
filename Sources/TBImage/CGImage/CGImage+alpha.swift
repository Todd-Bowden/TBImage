//
//  CGImage+alpha.swift
//  
//
//  Created by Todd Bowden on 5/20/23.
//

import Foundation
import CoreGraphics

public extension CGImage {
    
    func alpha(_ alpha: CGImage) throws -> CGImage {
        var alpha = alpha
        if self.isNotEqualSize(alpha) {
            alpha = try alpha.scale(width: self.width, height: self.height)
        }
        let context = try CGContext.rgbaContext(width:width, height: height)
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        context.clip(to: rect, mask: alpha)
        context.draw(self, in: rect)
        return try context.image()
    }
    
}
