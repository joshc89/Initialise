//
//  UILabel+Initialise.swift
//  Initialise
//
//  Created by Josh Campion on 17/08/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

/**
 
 Extension to allow configuration through a parameter object type. This allows for easier programmatic creation of [UILabel](https://developer.apple.com/reference/uikit/uilabel)s.
 
 See the [ReadMe](https://github.com/joshc89/Initialise) for examples.
 
 */
public extension UILabel {

    /**
     
     Configuration Model for a `UILabel`.
     
     - seealso: `UILabel.init(configuration:)`
     - seealso: `UILabel.configureWith(_:)`
     
     */
    public struct Configuration {
        
        /// Represents a `UILabel`'s `font`.
        public let font: UIFont
        
        /// Represents a `UILabel`'s `textColor`.
        public let textColor: UIColor
        
        /// Represents a `UILabel`'s `textAlignment`.
        public let textAlignment: NSTextAlignment
        
        /// Represents a `UILabel`'s `numberOfLines`.
        public let numberOfLines: Int
        
        /// Represents a `UILabel`'s `lineBreakMode`.
        public let lineBreakMode: NSLineBreakMode
        
        /// Represents a `UILabel`'s `translatesAutoresizingMaskIntoConstraints`.
        public let translatesAutoresizingMaskIntoConstraints: Bool
        
        /**
 
         Convenience initialiser for creating a label configuration with a `UIFontTextStyle` instead of a font. All other parameters are passed through to the default initialiser with the same default values.
         
         - parameter textStyle: Default value is Body.
        */
        public init(textStyle: String = UIFontTextStyleBody,
                    textColor: UIColor = UIColor.blackColor(),
                    textAlignment: NSTextAlignment = .Natural,
                    numberOfLines: Int = 1,
                    lineBreakMode: NSLineBreakMode = .ByTruncatingTail,
                    translatesAutoresizingMaskIntoConstraints: Bool = false) {
            
            self.init(font: UIFont.preferredFontForTextStyle(textStyle),
                      textColor: textColor,
                      textAlignment: textAlignment,
                      numberOfLines: numberOfLines,
                      lineBreakMode: lineBreakMode,
                      translatesAutoresizingMaskIntoConstraints: translatesAutoresizingMaskIntoConstraints)
        }
        
        /**
         
         Default initialiser. Sets all properties.
         
         - parameter font: Must be provided.
         - parameter textColor: Default value is black.
         - parameter textAlignment: Default value is `.Natural`.
         - parameter numberOfLines: Default value is 1.
         - parameter lineBreakMode: Default value is `.ByTruncatingTail`.
         - parameter translatesAutoresizingMaskIntoConstraints: Default value is `false`.
         
         */
        public init(font: UIFont,
                    textColor: UIColor = UIColor.blackColor(),
                    textAlignment: NSTextAlignment = .Natural,
                    numberOfLines: Int = 1,
                    lineBreakMode: NSLineBreakMode = .ByTruncatingTail,
                    translatesAutoresizingMaskIntoConstraints: Bool = false) {
            
            self.font = font
            self.textColor = textColor
            self.textAlignment = textAlignment
            self.numberOfLines = numberOfLines
            self.lineBreakMode = lineBreakMode
            self.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        }
    }

    /**
     
     Convenience initialiser to programmatically create a label with optional text and a given set of properties.
     
     - note: The inclusion of an optional text parameter is to mirror the initialiser `UIImageView.init(image: UIImage?)`. This is not included in the configuration as there is a the mutually exclusive `attributedText` property. It would also make it hard to define specific reusable configurations as styles, as the `text` / `attributedText` variables would always have to be `nil` with such configurations, and the user couldn't use a defined configuration and set the text at the same time.
     
     - parameter text: An optional string to set as the text of the label
     - parameter configuration: The properties to assign to the label.
     
     - seealso: `init(attributedText:configuration:)`
     
     */
    public convenience init(text: String? = nil, configuration: Configuration) {
        self.init()
        self.text = text
        configureWith(configuration)
    }
    
    /**
     
     Convenience initialiser to programmatically create a label with optional attributed text and a given set of properties.
     
     - note: The inclusion of an optional attributedtext parameter is to mirror the initialiser `UIImageView.init(image: UIImage?)`. This is not included in the configuration as there is a mutually exclusive `text` property. It would also make it hard to define specific reusable configurations as styles, as the `text` / `attributedText` variables would always have to be `nil` with such configurations, and the user couldn't use a defined configuration and set the text at the same time.
     
     - parameter attributedText: An optional attributed string to set as the text of the label
     - parameter configuration: The properties to assign to the label.
     
     - seealso: `init(attributedText:configuration:)`
     
     */
    public convenience init(attributedText: NSAttributedString? = nil, configuration: Configuration) {
        self.init()
        self.attributedText = attributedText
        configureWith(configuration)
    }
    
    /** 
     
     Configures the label based on the given configuration. This is called from `init(configuration:)` after initialisation.
     
     - parameter configuration: The collection of properties to assign to this label.

    */
    public func configureWith(configuration: Configuration) {
        
        self.font = configuration.font
        self.textColor = configuration.textColor
        self.textAlignment = configuration.textAlignment
        self.numberOfLines = configuration.numberOfLines
        self.lineBreakMode = configuration.lineBreakMode
        self.translatesAutoresizingMaskIntoConstraints = configuration.translatesAutoresizingMaskIntoConstraints
    }
}