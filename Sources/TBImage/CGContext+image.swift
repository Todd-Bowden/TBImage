//
//  CGContext+image.swift
//
//
//  Created by Todd Bowden on 6/22/23.
//

import Foundation
import CoreGraphics

extension CGContext {
    
    func image() throws -> CGImage {
        guard let cgImage = self.makeImage() else {
            throw TBImageError.errorCreatingCGImage
        }
        return cgImage
    }
    
}
