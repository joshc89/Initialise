//
//  UIImageView+Initialise.swift
//  Initialise
//
//  Created by Josh Campion on 17/08/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

/**
 
 Extension to allow configuration through a parameter object type. This allows for easier programmatic creation of [UIImageViews](https://developer.apple.com/reference/uikit/uiimageview).
 
 See the [ReadMe](https://github.com/joshc89/Initialise) for examples.
 
 */
public extension UIImageView {
    
    /**
     
     Configuration Model for a `UIImageView`.
     
     - seealso: `UIImageView.init(configuration:)`
     - seealso: `UIImageView.configure(with:)`
     
     */
    public struct Configuration {
        
        /// Content of the view for this configuration. Represents a `UIImageViews`'s `image`.
        public let image: UIImage?
        
        /// Represents a `UIImageViews`'s `contentMode`.
        public let contentMode: UIViewContentMode
        
        /// Represents a `UIImageViews`'s `backgroundColor`.
        public let backgroundColor: UIColor?
        
        /// Represents a `UIImageViews`'s `isOpaque`.
        public let isOpaque: Bool
        
        /// Represents a `UIImageViews`'s `translatesAutoresizingMaskIntoConstraints`.
        public let translatesAutoresizingMaskIntoConstraints: Bool
        
        /**
         
         Default initialiser. Sets all properties.
         
         - parameter image: Default value is `nil`. 
         - parameter contentMode: Default value is `.ScaleToFill`.
         - parameter backgroundColor: Default value is `nil`.
         - parameter opaque: Default value is `false`.
         - parameter translatesAutoresizingMaskIntoConstraints: Default value is `false`.
         
         */
        public init(image: UIImage? = nil,
             contentMode: UIViewContentMode = .scaleToFill,
             backgroundColor: UIColor? = nil,
             isOpaque: Bool = true,
             translatesAutoresizingMaskIntoConstraints: Bool = false) {
            
            self.image = image
            self.backgroundColor = backgroundColor
            self.contentMode = contentMode
            self.isOpaque = isOpaque
            self.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        }
    }
    
    /// Convenience initialiser to programmatically create an image view with a given set of properties.
    public convenience init(configuration: Configuration) {
        self.init(image: configuration.image)
        self.configure(with: configuration)
    }
    
    /**
     
     Configures this image view based on the given configuration. This is called from `init(configuration:)` after initialisation.
     
     - parameter configuration: The collection of properties to assign to this image view.
     
     */
    public func configure(with configuration: Configuration) {
        self.image = configuration.image
        self.contentMode = configuration.contentMode
        self.backgroundColor = configuration.backgroundColor
        self.isOpaque = configuration.isOpaque
        self.translatesAutoresizingMaskIntoConstraints = configuration.translatesAutoresizingMaskIntoConstraints
    }
}
