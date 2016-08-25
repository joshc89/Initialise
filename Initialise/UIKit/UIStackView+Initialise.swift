//
//  UIStackView+Initialise.swift
//  Initialise
//
//  Created by Josh Campion on 18/08/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit


/**
 
 Extension to allow configuration through a parameter object type. This allows for easier programmatic creation and configuration of [UIStackViews](https://developer.apple.com/reference/uikit/uistackview).
 
 See the [ReadMe](https://github.com/joshc89/Initialise) for examples.
 
 */
@available(iOS 9, *)
public extension UIStackView {
    
    /**
     
     Configuration Model for a `UIStackView`.
     
     - seealso: `UIStackView.init(configuration:)`
     - seealso: `UIStackView.configureWith(_:)`
     
     */
    public struct Configuration {
        
        /// Content of the view for this configuration. Used in `init(arrangedSubviews:)`.
        public let arrangedSubviews: [UIView]
        
        /// Represents a `UIStackView`'s `alignment`.
        public let alignment: UIStackViewAlignment
        
        /// Represents a `UIStackView`'s `axis`.
        public let axis: UILayoutConstraintAxis 
        
        /// Represents a `UIStackView`'s `baselineRelativeArrangement`.
        public let baselineRelativeArrangement: Bool 
        
        /// Represents a `UIStackView`'s `distribution`.
        public let distribution: UIStackViewDistribution
        
        /// Represents a `UIStackView`'s `layoutMarginsRelativeArrangement`.
        public let layoutMarginsRelativeArrangement: Bool  
        
        /// Represents a `UIStackView`'s `spacing`.
        public let spacing: CGFloat
        
        /// Represents a `UIStackView`'s `translatesAutoresizingMaskIntoConstraints`.
        public let translatesAutoresizingMaskIntoConstraints: Bool
        
        /**
         
         Default initialiser. Sets all properties.
         
         - parameter arrangedSubviews: Must be provided.
         - parameter axis: Default value is `.Horizontal`.
         - parameter distribution: Defaualt value is `.Fill`.
         - parameter alignment: Default value is `.Fill`.
         - parameter spacing: Default value is 0.0.
         - parameter baselineRelativeArrangment: Default value is `false`.
         - parameter layoutMarginsRelativeArrangement: Defaualt value is `false`.
         - parameter translatesAutoresizingMaskIntoConstraints: Default value is `false`.
         
        */
        public init(arrangedSubviews: [UIView],
                    axis: UILayoutConstraintAxis = .Horizontal,
                    distribution: UIStackViewDistribution,
                    alignment: UIStackViewAlignment = .Fill,
                    spacing: CGFloat = 0.0,
                    baselineRelativeArrangement: Bool = false,
                    layoutMarginsRelativeArrangement: Bool = false,
                    translatesAutoresizingMaskIntoConstraints: Bool = false) {
         
            self.arrangedSubviews = arrangedSubviews
            self.axis = axis
            self.distribution = distribution
            self.alignment = alignment
            self.spacing = spacing
            self.baselineRelativeArrangement = baselineRelativeArrangement
            self.layoutMarginsRelativeArrangement = layoutMarginsRelativeArrangement
            self.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        }
    }
    
    /**
     
     Convenience initialiser to create a stack view with a given set of properties.
     
     - parameter configuration: The properties to assign to the stack view.
     
     */
    public convenience init(configuration: Configuration) {
        
        self.init(arrangedSubviews: configuration.arrangedSubviews)
        self.configureWith(configuration)
    }
    
    /**
     
     Configures this stack view based on the given configuration. This is called from `init(configuration:)` after initialisation.
     
     - warning: This currently does **not** update the views due to ineffeciency in modifying the hierarchy.
     
     - parameter configuration: The collection of properties to assign to this image view.
     
    */
    public func configureWith(configuration: Configuration) {
        
        // TODO: Compare current arranged subviews with new arranged subviews and add / remove / insert based on differences.
        
        self.axis = configuration.axis
        self.distribution = configuration.distribution
        self.alignment = configuration.alignment
        self.spacing = configuration.spacing
        self.baselineRelativeArrangement = configuration.baselineRelativeArrangement
        self.layoutMarginsRelativeArrangement = configuration.layoutMarginsRelativeArrangement
        self.translatesAutoresizingMaskIntoConstraints = configuration.translatesAutoresizingMaskIntoConstraints
    }
    
}