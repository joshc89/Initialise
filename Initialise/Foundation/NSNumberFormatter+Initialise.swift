//
//  NSNumberFormatter+Initialise.swift
//  Initialise
//
//  Created by Josh Campion on 19/08/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import Foundation

/**
 
 Extension to allow configuration through a parameter object type. As `NSNumberFormatter`s can be expensive to create, `static` class level variables are a good candidate for specifying a formatter. Typically this can be done in a closure. The `NSNumberFormatter.Configuration` struct allows this to be simplifier.
 
 See the [ReadMe](https://github.com/joshc89/Initialise) for examples.
 
 */
public extension NSNumberFormatter {
    
    /**
     
     Configuration Model for an `NSNumberFormatter`.
     
     - seealso: `NSNumberFormatter.init(configuration:)`
     - seealso: `NSNumberFormatter.configureWith(_:)`
     
     */
    public struct Configuration {
        
        /// Represents the number formatter's `numberStyle`.
        public let numberStyle: NSNumberFormatterStyle
        
        /// Represents the number formatter's `locale`.
        public let locale: NSLocale
        
        /// Optional representation of `minimumFractionDigits`. This can be `nil` to leave the number formatter with the default value given by the `numberStyle`.
        public let minimumFractionDigits: Int?
        
        /// Optional representation of `maximumFractionDigits`. This can be `nil` to leave the number formatter with the default value given by the `numberStyle`.
        public let maximumFractionDigits: Int?
        
        /// Optional representation of `minimumSignificantDigits`. This can be `nil` to leave the number formatter with the default value given by the `numberStyle`.
        public let minimumSignificantDigits: Int?
        
        /// Optional representation of `maximumSignificantDigits`. This can be `nil` to leave the number formatter with the default value given by the `numberStyle`.
        public let maximumSignificantDigits: Int?
        
        /// Optional representation of `minimumIntegerDigits`. This can be `nil` to leave the number formatter with the default value given by the `numberStyle`.
        public let minimumIntegerDigits: Int?
        
        /// Optional representation of `maximumIntegerDigits`. This can be `nil` to leave the number formatter with the default value given by the `numberStyle`.
        public let maximumIntegerDigits: Int?
        
        /**
         
         Default initialiser. 
         
         - parameter numberStyle: Must be provided.
         - parameter locale: Default value is `.currentLocale()`.
         
         - parameter minimumFractionDigits: Optional specification, default value is nil.
         - parameter maximumFractionDigits: Optional specification, default value is nil.
         
         - parameter minimumSignificantDigits: Optional specification, default value is nil.
         - parameter maximumSignificantDigits: Optional specification, default value is nil.
         
         - parameter minimumIntegerDigits: Optional specification, default value is nil.
         - parameter maximumIntegerDigits: Optional specification, default value is nil.
         */
        public init(numberStyle: NSNumberFormatterStyle,
                    locale: NSLocale = NSLocale.currentLocale(),
                    minimumFractionDigits: Int? = nil,
                    maximumFractionDigits: Int? = nil,
                    minimumSignificantDigits: Int? = nil,
                    maximumSignificantDigits: Int? = nil,
                    minimumIntegerDigits: Int? = nil,
                    maximumIntegerDigits: Int? = nil) {
            
            
            self.numberStyle = numberStyle
            self.locale = locale
            
            self.minimumFractionDigits = minimumFractionDigits
            self.maximumFractionDigits = maximumFractionDigits
            
            self.minimumSignificantDigits = minimumSignificantDigits
            self.maximumSignificantDigits = maximumSignificantDigits
            
            self.minimumIntegerDigits = minimumIntegerDigits
            self.maximumIntegerDigits = maximumIntegerDigits
        }
    }
    
    /// Convenience initialiser to create a number formatter with a given set of properties.
    public convenience init(configuration: Configuration) {
        self.init()
        configureWith(configuration)
    }
    
    /**
     
     Configures this number formatter based on the given configuration. This is called from `init(configuration:)` after initialisation.
     
     - parameter configuration: The collection of properties to assign to this date formatter.
     
     */
    public func configureWith(configuration: Configuration) {
        
        self.numberStyle =  configuration.numberStyle
        self.locale = configuration.locale
        
        if let m = configuration.maximumFractionDigits {
            self.minimumFractionDigits = m
        }
        
        if let m = configuration.minimumFractionDigits {
            self.maximumFractionDigits = m
        }
        
        if let m = configuration.minimumSignificantDigits {
            self.minimumSignificantDigits = m
        }
        
        if let m = configuration.maximumSignificantDigits {
            self.maximumSignificantDigits = m
        }
        
        if let m = configuration.minimumIntegerDigits {
            self.minimumIntegerDigits = m
        }
        
        if let m = configuration.maximumIntegerDigits {
            self.maximumIntegerDigits = m
        }
    }
}