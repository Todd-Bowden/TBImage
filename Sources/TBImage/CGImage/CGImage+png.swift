//
//  CGImage+png.swift
//
//
//  Created by Todd Bowden on 6/24/23.
//

import Foundation
import CoreGraphics
#if canImport(UIKit)
import UIKit
#else
import AppKit
#endif

public extension CGImage {
    
    static func image(png: Data) throws -> CGImage {
        guard let provider = CGDataProvider(data: png as CFData) else {
            throw TBImageError.pngCreationError
        }
        guard let image = CGImage(
            pngDataProviderSource: provider,
            decode: nil,
            shouldInterpolate: false,
            intent: .defaultIntent
        ) else {
            throw TBImageError.pngCreationError
        }
        return image
    }
    
    static func pngResource(path: String, bundle: Bundle? = nil) throws -> CGImage {
        let bundle = bundle ?? Bundle.main
        guard let url = bundle.url(forResource: path, withExtension: "png") else {
            throw TBImageError.pngResourceNotFoundAtPath(path)
        }
        let data = try Data(contentsOf: url)
        return try CGImage.image(png: data)
    }
    
    var png: Data? {
        try? pngData()
    }
    
    #if canImport(UIKit)
    func pngData() throws -> Data {
        guard let png = UIImage(cgImage: self).pngData() else {
            throw TBImageError.pngCreationError
        }
        return png
    }
    #else
    func pngData() throws -> Data {
        let imageRep = NSBitmapImageRep(cgImage: self)
        imageRep.size = NSSize(width: self.width, height: self.height)
        guard let png = imageRep.representation(using: NSBitmapImageRep.FileType.png, properties: [:]) else {
            throw TBImageError.pngCreationError
        }
        return png
    }
    #endif
    
}
