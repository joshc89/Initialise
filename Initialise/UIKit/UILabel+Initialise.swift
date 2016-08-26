//
//  UILabel+Initialise.swift
//  Initialise
//
//  Created by Josh Campion on 17/08/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

/// Enum wrapping the two types of text representations.
public enum Text {
    
    /// A plain `String`, typically set to a `text` property.
    case plain(String)
    
    /// An `NSAttributedString`, typically set to an `attributedText` property.
    case attributed(NSAttributedString)
    
}

/**
 
 Extension to allow configuration through a parameter object type. This allows for easier programmatic creation of [UILabels](https://developer.apple.com/reference/uikit/uilabel).
 
 See the [ReadMe](https://github.com/joshc89/Initialise) for examples.
 
 */
public extension UILabel {

    /**
     
     Configuration Model for a `UILabel`.
     
     - seealso: `UILabel.init(configuration:)`
     - seealso: `UILabel.configure(with:)`
     
     */
    public struct Configuration {
        
        /// Content of the view for this configuration. Represents a `UILabel`'s `text` or `attributedText`.
        public let text: Text?
        
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
         
         - parameter text: Optional `Text` passed to the default initialiser. Default value is `nil`.
         - parameter textStyle: Default value is Body.
         
        */
        public init(text: Text? = nil,
                    textStyle: UIFontTextStyle = .body,
                    textColor: UIColor = .black,
                    textAlignment: NSTextAlignment = .natural,
                    numberOfLines: Int = 1,
                    lineBreakMode: NSLineBreakMode = .byTruncatingTail,
                    translatesAutoresizingMaskIntoConstraints: Bool = false) {
            
            self.init(text: text,
                      font: UIFont.preferredFont(forTextStyle: textStyle),
                      textColor: textColor,
                      textAlignment: textAlignment,
                      numberOfLines: numberOfLines,
                      lineBreakMode: lineBreakMode,
                      translatesAutoresizingMaskIntoConstraints: translatesAutoresizingMaskIntoConstraints)
        }
        
        /**
         
         Default initialiser. Sets all properties.
         
         - parameter text: Must be provided.
         - parameter font: Must be provided.
         - parameter textColor: Default value is black.
         - parameter textAlignment: Default value is `.Natural`.
         - parameter numberOfLines: Default value is 1.
         - parameter lineBreakMode: Default value is `.ByTruncatingTail`.
         - parameter translatesAutoresizingMaskIntoConstraints: Default value is `false`.
         
         */
        public init(text: Text?,
                    font: UIFont,
                    textColor: UIColor = .black,
                    textAlignment: NSTextAlignment = .natural,
                    numberOfLines: Int = 1,
                    lineBreakMode: NSLineBreakMode = .byTruncatingTail,
                    translatesAutoresizingMaskIntoConstraints: Bool = false) {
            
            self.text = text
            self.font = font
            self.textColor = textColor
            self.textAlignment = textAlignment
            self.numberOfLines = numberOfLines
            self.lineBreakMode = lineBreakMode
            self.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        }
    }
    
    /**
     
     Convenience initialiser to create a label with a given set of properties.
     
     - parameter configuration: The properties to assign to the label.
     
     */
    public convenience init(configuration: Configuration) {
        self.init()
        configure(with: configuration)
    }
    
    /** 
     
     Configures the label based on the given configuration. This is called from `init(configuration:)` after initialisation.
     
     - parameter configuration: The collection of properties to assign to this label.

    */
    public func configure(with configuration: Configuration) {
        
        self.font = configuration.font
        self.textColor = configuration.textColor
        self.textAlignment = configuration.textAlignment
        self.numberOfLines = configuration.numberOfLines
        self.lineBreakMode = configuration.lineBreakMode
        self.translatesAutoresizingMaskIntoConstraints = configuration.translatesAutoresizingMaskIntoConstraints
        self.set(text: configuration.text)
    }
    
    /// Sets either the `text` or `attributedText` based on the given `Text` object.
    public func set(text: Text?) {
        
        if let t = text {
            switch t {
            case .plain(let str):
                self.text = str
            case .attributed(let str):
                self.attributedText = str
            }
        } else {
            self.text = nil
            self.attributedText = nil
        }
    }
}
