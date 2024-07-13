//
//  CGImage+jpg.swift
//
//
//  Created by Todd Bowden on 6/24/23.
//

import Foundation
import CoreGraphics

public extension CGImage {
    
    static func image(jpeg: Data) throws -> CGImage {
        guard let provider = CGDataProvider(data: jpeg as CFData) else {
            throw TBImageError.jpegCreationError
        }
        guard let image = CGImage(
            jpegDataProviderSource: provider,
            decode: nil,
            shouldInterpolate: false,
            intent: .defaultIntent
        ) else {
            throw TBImageError.jpegCreationError
        }
        return image
    }
    
    static func jpegResource(url: URL) throws -> CGImage {
        let data = try Data(contentsOf: url)
        return try CGImage.image(jpeg: data)
    }
    
    static func jpegResource(path: String, bundle: Bundle? = nil) throws -> CGImage {
        let bundle = bundle ?? Bundle.main
        guard let url = bundle.url(forResource: path, withExtension: "jpg") ?? bundle.url(forResource: path, withExtension: "jpeg") else {
            throw TBImageError.jpegResourceNotFoundAtPath(path)
        }
        let data = try Data(contentsOf: url)
        return try CGImage.image(jpeg: data)
    }
    
}
