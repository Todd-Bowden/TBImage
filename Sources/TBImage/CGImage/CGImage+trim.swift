//
//  CGImage+trim.swift
//
//
//  Created by Todd Bowden on 11/22/23.
//

import Foundation
import CoreGraphics

public extension CGImage {
    
    func trim(_ t: Int) -> CGImage? {
        let w = self.width - t - t
        let h = self.height - t - t
        let frame = CGRect(x: t, y: t, width: w, height: h)
        return self.cropping(to: frame)
    }
    
}
