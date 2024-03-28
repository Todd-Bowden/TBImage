//
//  CGImage+uiImage.swift
//
//
//  Created by Todd Bowden on 3/24/24.
//

#if canImport(UIKit)

import Foundation
import CoreGraphics
import UIKit

public extension CGImage {
    
    var uiImage: UIImage {
        UIImage(cgImage: self)
    }

}

public extension UIImage {
    
    static func path(_ path: String, bundle: Bundle) -> UIImage? {
        CGImage.path(path, bundle: bundle)?.uiImage
    }
}

#endif
