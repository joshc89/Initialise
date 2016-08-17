//
//  UIImageView+Initialise.swift
//  Initialise
//
//  Created by Josh Campion on 17/08/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

/**
 
 Extension to allow configuration through a parameter object type. This allows for easier programmatic creation of [UIImageView](https://developer.apple.com/reference/uikit/uiimageview)s.
 
 See the [ReadMe](https://github.com/joshc89/Initialise) for examples.
 
 */
public extension UIImageView {
    
    /**
     
     Configuration Model for a `UIImageView`.
     
     - seealso: `UIImageView.init(configuration:)`
     - seealso: `UIImageView.configureWith(_:)`
     
     */
    public struct Configuration {
        
        /// Represents a `UIImageViews`'s `contentMode`.
        let contentMode: UIViewContentMode
        
        /// Represents a `UIImageViews`'s `isOpaque`.
        let opaque: Bool
        
        /// Represents a `UIImageViews`'s `backgroundColor`.
        let backgroundColor: UIColor?
        
        /// Represents a `UIImageViews`'s `translatesAutoresizingMaskIntoConstraints`.
        public let translatesAutoresizingMaskIntoConstraints: Bool
        
        /**
         
         Default initialiser. Sets all properties.
         
         - parameter contentMode: Default value is `.ScaleToFill`.
         - parameter backgroundColor: Default value is `nil`.
         - parameter opaque: Default value is `false`.
         - parameter translatesAutoresizingMaskIntoConstraints: Default value is `false`.
         
         */
        init(contentMode: UIViewContentMode = .ScaleToFill,
             backgroundColor: UIColor? = nil,
             opaque: Bool = true,
             translatesAutoresizingMaskIntoConstraints: Bool = false) {
            
            self.backgroundColor = backgroundColor
            self.contentMode = contentMode
            self.opaque = opaque
            self.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        }
    }
    
    /**
 
     Convenience initialiser to programmatically create an image view with a given set of properties.
     
     - parameter image: Optional image to initialise this image view with. Default value is `nil`.
     
    */
    public convenience init(image: UIImage? = nil, configuration: Configuration) {
        self.init(image: image)
        self.configureWith(configuration)
    }
    
    /**
     
     Configures the image view based on the given configuration. This is called from `init(configuration:)` after initialisation.
     
     - parameter configuration: The collection of properties to assign to this image view.
     
     */
    public func configureWith(configuration: Configuration) {
        self.contentMode = configuration.contentMode
        self.translatesAutoresizingMaskIntoConstraints = configuration.translatesAutoresizingMaskIntoConstraints
        self.opaque = configuration.opaque
    }
}