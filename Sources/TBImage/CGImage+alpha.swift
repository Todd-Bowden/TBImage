//
//  CGImage+alpha.swift
//  
//
//  Created by Todd Bowden on 5/20/23.
//

import Foundation
import CoreGraphics
import TBMetalImage

public extension CGImage {
    
    func alpha(_ alpha: CGImage) throws -> CGImage {
        try self.assertEqualSize(alpha)
        return try self.metal(function: "alpha", bundle: Bundle.module, images: [alpha])
    }
    
}
