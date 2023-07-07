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
        let flipHorizontal = CGAffineTransform(a: -1, b: 0, c: 0, d: 1, tx: CGFloat(self.width), ty: 0)
        context.concatenate(flipHorizontal)
        context.draw(self, in: CGRect(x: 0, y: 0, width: self.width, height: self.height))
        return try context.image()
    }
    
    func flipVertical() throws -> CGImage {
        let context = try self.context()
        let flipVertical = CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: CGFloat(self.height))
        context.concatenate(flipVertical)
        context.draw(self, in: CGRect(x: 0, y: 0, width: self.width, height: self.height))
        return try context.image()
    }
    
}
