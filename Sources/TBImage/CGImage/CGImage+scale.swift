//
//  CGImage+scale.swift
//  
//
//  Created by Todd Bowden on 6/21/23.
//

import Foundation
import CoreGraphics

public extension CGImage {
    
    func scale(width: Int, height: Int) throws -> CGImage {
        let context = try self.context(width: width, height: height)
        context.draw(self, in: CGRect(x: 0, y: 0, width: width, height: height))
        return try context.image()
    }
    
    func scaleRGBA(width: Int, height: Int) throws -> CGImage {
        let context = try CGContext.rgbaContext(width: width, height: height)
        context.draw(self, in: CGRect(x: 0, y: 0, width: width, height: height))
        return try context.image()
    }
    
}
