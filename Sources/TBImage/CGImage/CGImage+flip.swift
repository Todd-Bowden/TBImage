//
//  CGImage+flip.swift
//  
//
//  Created by Todd Bowden on 6/21/23.
//

import Foundation
import CoreGraphics

public extension CGImage {
    
    func flipHorizontal() throws -> CGImage {
        let context = try self.context()
        context.scaleBy(x: -1, y: 1)
        context.draw(self, in: CGRect(x: 0, y: 0, width: self.width, height: self.height))
        return try context.image()
    }
    
    func flipVertical() throws -> CGImage {
        let context = try self.context()
        context.scaleBy(x: 1, y: -1)
        context.draw(self, in: CGRect(x: 0, y: 0, width: self.width, height: self.height))
        return try context.image()
    }
    
}
