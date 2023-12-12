//
//  CGImage+assertEqualSize.swift
//  
//
//  Created by Todd Bowden on 5/20/23.
//

import Foundation
import CoreGraphics

public extension CGImage {
    
    func isEqualSize(_ image: CGImage)-> Bool {
        self.height == image.height && self.width == image.width
    }
    
    func isNotEqualSize(_ image: CGImage)-> Bool {
        !isEqualSize(image)
    }
    
    func assertEqualSize(_ image: CGImage) throws {
        guard self.isEqualSize(image) else {
            throw TBImageError.unequalImageSizes
        }
    }
    
}
