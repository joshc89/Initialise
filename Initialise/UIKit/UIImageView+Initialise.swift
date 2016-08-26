//
//  UIImageView+Initialise.swift
//  Initialise
//
//  Created by Josh Campion on 17/08/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

/**
 
 Extension for easier programmatic creation of [UIImageViews](https://developer.apple.com/reference/uikit/uiimageview).
 
 See the [ReadMe](https://github.com/joshc89/Initialise) for examples.
 
 */
public extension UIImageView {
    
    /**
     
     Convenience initialiser to programmatically create an image view with a given set of properties.
     - parameter image: Default value is `nil`.
     - parameter contentMode: Default value is `.ScaleToFill`.
     - parameter backgroundColor: Default value is `nil`.
     - parameter opaque: Default value is `false`.
     - parameter translatesAutoresizingMaskIntoConstraints: Default value is `false`.
     
     */
    public convenience init(image: UIImage? = nil,
                            contentMode: UIViewContentMode = .scaleToFill,
                            backgroundColor: UIColor? = nil,
                            isOpaque: Bool = true,
                            translatesAutoresizingMaskIntoConstraints: Bool = false) {
        self.init(image: image)
        
        self.image = image
        self.contentMode = contentMode
        self.backgroundColor = backgroundColor
        self.isOpaque = isOpaque
        self.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
    }
}
