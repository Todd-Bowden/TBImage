//
//  Image+cgImage.swift
//
//
//  Created by Todd Bowden on 6/25/23.
//

import Foundation
import SwiftUI
#if canImport(UIKit)
import UIKit
#else
import AppKit
#endif

public extension Image {
    
    #if canImport(UIKit)
    init(cgImage: CGImage, orientation: UIImage.Orientation = .up) {
        let screenScale = UIScreen.main.scale
        let uiImage = UIImage(cgImage: cgImage, scale: screenScale, orientation: orientation)
        self.init(uiImage: uiImage)
    }
    #endif
    
}
