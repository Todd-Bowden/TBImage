//
//  CGImage+assertEqualSize.swift
//  
//
//  Created by Todd Bowden on 5/20/23.
//

import Foundation
import CoreGraphics

public extension CGImage {
    
    func assertEqualSize(_ image: CGImage) throws {
        guard self.height == image.height && self.width == image.width else {
            throw TBImageError.unequalImageSizes
        }
    }
    
}
