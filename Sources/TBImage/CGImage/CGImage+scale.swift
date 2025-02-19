//
//  CGImage+scale.swift
//  
//
//  Created by Todd Bowden on 6/21/23.
//

import Foundation
import CoreGraphics

public extension CGImage {
    
    func scale(size: CGSize) throws -> CGImage {
        try scale(width: Int(size.width), height: Int(size.height))
    }
    
    func scale(width: Int, height: Int) throws -> CGImage {
        let context = try self.context(width: width, height: height)
        context.interpolationQuality = .high
        context.draw(self, in: CGRect(x: 0, y: 0, width: width, height: height))
        return try context.image()
    }
    
    func scaleRGBA(size: CGSize) throws -> CGImage {
        try scaleRGBA(width: Int(size.width), height: Int(size.height))
    }
    
    func scaleRGBA(width: Int, height: Int) throws -> CGImage {
        let context = try CGContext.rgbaContext(width: width, height: height)
        context.draw(self, in: CGRect(x: 0, y: 0, width: width, height: height))
        return try context.image()
    }
    
}
