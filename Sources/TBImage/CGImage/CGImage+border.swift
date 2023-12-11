//
//  CGImage+border.swift
//
//
//  Created by Todd Bowden on 11/21/23.
//

import Foundation
import CoreGraphics

public extension CGImage {
    
    func addBorder(_ border: Int, color: CGColor? = nil) throws -> CGImage {
        let color = color ?? CGColor(red: 0, green: 0, blue: 0, alpha: 0)
        let w = self.width + border + border
        let h = self.height + border + border
        let context = try CGContext.rgbaContext(width: w, height: h)
        context.setFillColor(color)
        context.fill(CGRect(x: 0, y: 0, width: w, height: h))
        context.draw(self, in: CGRect(x: border, y: border, width: width, height: height))
        return try context.image()
    }
    
}
