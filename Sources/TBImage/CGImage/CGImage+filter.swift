//
//  CGImage+filter.swift
//
//
//  Created by Todd Bowden on 3/24/24.
//

import Foundation
import CoreGraphics
import CoreImage

public extension CGImage {
    
    func filter(_ name: String) -> CGImage? {
        let ciImage = CoreImage.CIImage(cgImage: self)
        guard let filter = CIFilter(name: name) else { return nil }
        filter.setDefaults()
        filter.setValue(ciImage, forKey: kCIInputImageKey)
        let context = CIContext(options: nil)
        guard let outputImage = filter.outputImage else { return nil }
        return context.createCGImage(outputImage, from: outputImage.extent)
    }
    
    func filter(_ name: String, parameters: [String : Any]) -> CGImage? {
        let ciImage = CoreImage.CIImage(cgImage: self)
        guard let filter = CIFilter(name: name, parameters: parameters) else { return nil }
        filter.setValue(ciImage, forKey: kCIInputImageKey)
        let context = CIContext(options: nil)
        guard let outputImage = filter.outputImage else { return nil }
        return context.createCGImage(outputImage, from: outputImage.extent)
    }
    
    var invert: CGImage? {
        self.filter("CIColorInvert")
    }
    
    func saturation(_ s: CGFloat) -> CGImage? {
        filter("CIColorControls", parameters: [kCIInputSaturationKey:s])
    }
    
}


