//
//  UIActivityIndicatorView+Initialise.swift
//  Initialise
//
//  Created by Joshua Campion on 23/09/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

public extension UIActivityIndicatorView {
    
    /**
     
     - parameter style: The style to create this indicator with.
     - parameter color: Default value is `nil`.
     - parameter started: Flag to allow the created indicator to begin animating immediately. Default value is `false`.
     - parameter hidesWhenStopped: Default value is `true`.
     - parameter translatesAutoresizingMaskIntoConstraints: Default value is `false`.
    */
    public convenience init(style: UIActivityIndicatorViewStyle,
                     color: UIColor? = nil,
                     started: Bool = false,
                     hidesWhenStopped: Bool = true,
                     translatesAutoresizingMaskIntoConstraints: Bool = false) {
        
        self.init(activityIndicatorStyle: style)
        self.hidesWhenStopped = hidesWhenStopped
        self.color = color
        self.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        
        if started {
            self.startAnimating()
        }
    }
}
