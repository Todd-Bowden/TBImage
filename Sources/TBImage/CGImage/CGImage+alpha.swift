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
        guard let image = self.masking(alpha) else {
            throw TBImageError.errorCreatingCGImage
        }
        return image
    }
    
}
