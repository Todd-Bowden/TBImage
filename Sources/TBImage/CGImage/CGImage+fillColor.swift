//
//  CGImage+fillColor.swift
//  
//
//  Created by Todd Bowden on 5/20/23.
//

import Foundation
import CoreGraphics

public extension CGImage {
    
    static func fill(color: CGColor, size: CGSize) throws -> CGImage {
        try fill(color: color, width: Int(size.width), height: Int(size.height))
    }
    
    static func fill(color: CGColor, width: Int, height: Int) throws -> CGImage {
        let context = try CGContext.rgbaContext(width: width, height: height)
        context.setFillColor(color)
        context.fill(CGRect(x: 0, y: 0, width: width, height: height))
        return try context.image()
    }
    
    func fill(color: CGColor, blendMode: CGBlendMode? = nil) throws -> CGImage {
        let context = try CGContext.rgbaContext(width:width, height: height)
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        context.draw(self, in: rect)
        context.setFillColor(color)
        if let blendMode {
            context.setBlendMode(blendMode)
        }
        context.fill(CGRect(x: 0, y: 0, width: width, height: height))
        return try context.image()
    }
    
}
