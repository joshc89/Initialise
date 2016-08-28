//
//  UIStackView+Initialise.swift
//  Initialise
//
//  Created by Josh Campion on 18/08/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit


/**
 
 Extension for easier programmatic creation and configuration of [UIStackViews](https://developer.apple.com/reference/uikit/uistackview).
 
 See the [ReadMe](https://github.com/joshc89/Initialise) for examples.
 
 */
@available(iOS 9, *)
public extension UIStackView {
    
    /**
     
     Convenience initialiser to create a stack view with a given set of properties.
     
     - parameter arrangedSubviews: Must be provided.
     - parameter axis: Default value is `.Horizontal`.
     - parameter distribution: Defaualt value is `.Fill`.
     - parameter alignment: Default value is `.Fill`.
     - parameter spacing: Default value is 0.0.
     - parameter baselineRelativeArrangment: Default value is `false`.
     - parameter layoutMarginsRelativeArrangement: Defaualt value is `false`.
     - parameter translatesAutoresizingMaskIntoConstraints: Default value is `false`.
     
     */
    public convenience init(arrangedSubviews: [UIView],
                axis: UILayoutConstraintAxis = .horizontal,
                distribution: UIStackViewDistribution,
                alignment: UIStackViewAlignment = .fill,
                spacing: CGFloat = 0.0,
                isBaselineRelativeArrangement: Bool = false,
                isLayoutMarginsRelativeArrangement: Bool = false,
                translatesAutoresizingMaskIntoConstraints: Bool = false) {
        
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
        self.isBaselineRelativeArrangement = isBaselineRelativeArrangement
        self.isLayoutMarginsRelativeArrangement = isLayoutMarginsRelativeArrangement
        self.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
    }
}
