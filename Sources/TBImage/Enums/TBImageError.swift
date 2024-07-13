//
//  TBImageError.swift
//  
//
//  Created by Todd Bowden on 5/13/23.
//

import Foundation

public enum TBImageError: Error {
    case errorCreatingCGContext
    case errorCreatingCGImage
    case unequalImageSizes
    case invalidPixelFormat
    case pngCreationError
    case pngResourceNotFoundAtPath(String)
    case jpegCreationError
    case jpegResourceNotFoundAtPath(String)
}
