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
        try self.assertEqualSize(alpha)
        let context = try self.context()
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        context.clip(to: rect, mask: alpha)
        context.draw(self, in: rect)
        return try context.image()
    }
    
}
