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
 
 Extension for easier programmatic creation of [UILabels](https://developer.apple.com/reference/uikit/uilabel).
 
 See the [ReadMe](https://github.com/joshc89/Initialise) for examples.
 
 */
public extension UILabel {
    
    /**
     
     Convenience initialiser for creating a label configuration with a `UIFontTextStyle` instead of a font. All other parameters are passed through to the default initialiser with the same default values.
     
     - parameter textStyle: Used to create a font for this label, default value is `.body`.
     
     */
    public convenience init(text: Text?,
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
     
     Convenience initialiser to create a label for use with autolayout with a given set of properties.
     
     - parameter text: Must be provided.
     - parameter font: Must be provided.
     - parameter textColor: Default value is black.
     - parameter textAlignment: Default value is `.Natural`.
     - parameter numberOfLines: Default value is 1.
     - parameter lineBreakMode: Default value is `.byTruncatingTail`.
     - parameter translatesAutoresizingMaskIntoConstraints: Default value is `false`.
     
     */
    public convenience init(text: Text?,
                            font: UIFont,
                            textColor: UIColor = .black,
                            textAlignment: NSTextAlignment = .natural,
                            numberOfLines: Int = 1,
                            lineBreakMode: NSLineBreakMode = .byTruncatingTail,
                            translatesAutoresizingMaskIntoConstraints: Bool = false) {
        
        self.init()
        
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.lineBreakMode = lineBreakMode
        self.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        self.set(text: text)
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
