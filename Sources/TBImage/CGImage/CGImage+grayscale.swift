//
//  CGImage+grayscale.swift
//
//
//  Created by Todd Bowden on 11/15/23.
//

import Foundation
import CoreGraphics

public extension CGImage {
    
    func grayscale() throws -> CGImage {
        let context = try CGContext.grayContext(width:width, height: height)
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        context.draw(self, in: rect)
        return try context.image()
    }
    
}
