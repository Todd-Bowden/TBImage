//
//  CGImage+flip.swift
//  
//
//  Created by Todd Bowden on 6/21/23.
//

import Foundation
import CoreGraphics
import MetalKit
import TBMetalImage

public extension CGImage {
    
    func flipHorizontal() throws -> CGImage {
        try flip(orientation: "horizontal")
    }
    
    func flipVertical() throws -> CGImage {
        try flip(orientation: "vertical")
    }
    
    private func flip(orientation: String) throws -> CGImage {
        let commandBuffer = try TBMakeMetalCommandBuffer.makeDefault()
        let device = commandBuffer.device
        
        // Create textures
        let loader = MTKTextureLoader(device: device)
        let selfTexture = try loader.newTexture(cgImage: self)
        let outTexture = try device.emptyTexture(width: width, height: height, format: selfTexture.pixelFormat)
        
        var function = "flip_" + orientation
        switch selfTexture.pixelFormat {
        case .rgba8Unorm:
            function += "_rgba"
        case .r8Unorm:
            function +=  "_gray"
        default:
            throw TBImageError.invalidPixelFormat
        }
        
        try commandBuffer.encode(function, bundle: Bundle.module, inTexture: selfTexture, outTexture: outTexture)
        
        // Commit and wait
        commandBuffer.commit()
        commandBuffer.waitUntilCompleted()
        
        // Return cgImage
        return try outTexture.cgImage()
    }
    
}
