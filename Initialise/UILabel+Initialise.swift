//
//  UILabel+Initialise.swift
//  Initialise
//
//  Created by Josh Campion on 17/08/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

/**
 
 Extension to allow configuration through a parameter object type. This allows for easier programmatic creation of [UILabel](https://developer.apple.com/reference/uikit/uilabel)s using 'inversion of control'.
 
 
 This allows for combined initialisation and configuration within a variable declaration, e.g.
 
    class MyViewController: UIViewController {
 
        let label = UILabel(configuration: UILabel.Configuration(textColor: UIColor.lightGrayColor(), numberOfLines: 0))
 
    }
 
 vs configuring in a function body elsewhere in the class, e.g.
 
    class MyViewController: UIViewController {
 
        let label = UILabel()
 
        func viewDidLoad() {
            super.viewDidLoad()
 
            label.textColor = UIColor.lightGrayColor()
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
        }
    }
 
 This makes for clearer functions in the class.

 - seealso: ['Parameter Objects' by NatashaTheRobot](https://www.natashatherobot.com/parameter-objects/)
 - seealso: ['Configuration Models' by Jesse Squires](http://www.jessesquires.com/enums-as-configs/)
 
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

    ///Convenience initialiser to programmatically create a label with a given set of properties.
 
    public convenience init(configuration: Configuration) {
        self.init()
        configureWith(configuration)
    }
    
    public func configureWith(configuration: Configuration) {
        
        self.font = configuration.font
        self.textColor = configuration.textColor
        self.textAlignment = configuration.textAlignment
        self.numberOfLines = configuration.numberOfLines
        self.lineBreakMode = configuration.lineBreakMode
        self.translatesAutoresizingMaskIntoConstraints = configuration.translatesAutoresizingMaskIntoConstraints
    }
}

extension UILabel.Configuration {
 
    static var headlineConfiguration: UILabel.Configuration {
        return UILabel.Configuration(textStyle: UIFontTextStyleHeadline,
                                     textColor: UIColor.redColor(),
                                     numberOfLines: 0)
    }
    
    static func headlineConfiguration(alignment: NSTextAlignment = .Natural) -> UILabel.Configuration {
        return UILabel.Configuration(textStyle: UIFontTextStyleHeadline,
                                     textColor: UIColor.redColor(),
                                     numberOfLines: 0)
    }
}

class MyView: UIView {
    
    let headlineLabel = UILabel(configuration: UILabel.Configuration.headlineConfiguration)
    
    let centeredHeadlineLabel = UILabel(configuration: UILabel.Configuration.headlineConfiguration(.Center))
}