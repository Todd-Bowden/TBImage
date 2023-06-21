//
//  CGImage+scale.swift
//  
//
//  Created by Todd Bowden on 6/21/23.
//

import Foundation
import CoreGraphics
import MetalKit
import MetalPerformanceShaders
import TBMetalImage

public enum TBImageScaleMethod {
    case bilinear
    case lanczos
}

public extension CGImage {
    
    func scale(width: Int, height: Int, method: TBImageScaleMethod = .bilinear) throws -> CGImage {
        let startTime = CFAbsoluteTimeGetCurrent()
        
        let commandBuffer = try TBMakeMetalCommandBuffer.makeDefault()
        let device = commandBuffer.device
        
        // Create textures
        let loader = MTKTextureLoader(device: device)
        let selfTexture = try loader.newTexture(cgImage: self)
        let outTexture = try device.emptyTexture(width: width, height: height, format: selfTexture.pixelFormat)
        
        // Scale
        switch method {
        case .bilinear:
            MPSImageBilinearScale(device: device).encode(commandBuffer: commandBuffer, sourceTexture: selfTexture, destinationTexture: outTexture)
        case .lanczos:
            MPSImageLanczosScale(device: device).encode(commandBuffer: commandBuffer, sourceTexture: selfTexture, destinationTexture: outTexture)
        }
        
        // Commit and wait
        commandBuffer.commit()
        commandBuffer.waitUntilCompleted()
        
        let time = CFAbsoluteTimeGetCurrent() - startTime
        print("\(String(format: "%.05f", time)) seconds")
        
        // Return cgImage
        return try outTexture.cgImage()
    }
    
}
