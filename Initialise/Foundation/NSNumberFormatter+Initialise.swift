//
//  NSNumberFormatter+Initialise.swift
//  Initialise
//
//  Created by Josh Campion on 19/08/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import Foundation

/**
 
 As `NumberFormatter`s can be expensive to create, `static` class level variables are a good candidate for specifying a formatter. Typically this can be done in a closure. These convenience initialisers allow this to be simplified.
 
 See the [ReadMe](https://github.com/joshc89/Initialise) for examples.
 
 */
public extension NumberFormatter {
    
    /**
     
     Convenience initialiser to create a number formatter with a given set of properties.
     
     - parameter numberStyle: Must be provided.
     - parameter locale: Default value is `.current`.
     
     - parameter minimumFractionDigits: Optional specification. This can be `nil` to leave the number formatter with the default value given by the `numberStyle`. Default value is nil.
     - parameter maximumFractionDigits: Optional specification. This can be `nil` to leave the number formatter with the default value given by the `numberStyle`. Default value is nil.
     
     - parameter minimumSignificantDigits: Optional specification. This can be `nil` to leave the number formatter with the default value given by the `numberStyle`. Default value is nil.
     - parameter maximumSignificantDigits: Optional specification. This can be `nil` to leave the number formatter with the default value given by the `numberStyle`. Default value is nil.
     
     - parameter minimumIntegerDigits: Optional specification. This can be `nil` to leave the number formatter with the default value given by the `numberStyle`. Default value is nil.
     - parameter maximumIntegerDigits: Optional specification. This can be `nil` to leave the number formatter with the default value given by the `numberStyle`. Default value is nil.
     */
    public convenience init(numberStyle: NumberFormatter.Style,
                locale: Locale? = .current,
                minimumFractionDigits: Int? = nil,
                maximumFractionDigits: Int? = nil,
                minimumSignificantDigits: Int? = nil,
                maximumSignificantDigits: Int? = nil,
                minimumIntegerDigits: Int? = nil,
                maximumIntegerDigits: Int? = nil) {
        
        self.init()
        
        self.numberStyle = numberStyle
        self.locale = locale
        
        if let m = maximumFractionDigits {
            self.minimumFractionDigits = m
        }
        
        if let m = minimumFractionDigits {
            self.maximumFractionDigits = m
        }
        
        if let m = minimumSignificantDigits {
            self.minimumSignificantDigits = m
        }
        
        if let m = maximumSignificantDigits {
            self.maximumSignificantDigits = m
        }
        
        if let m = minimumIntegerDigits {
            self.minimumIntegerDigits = m
        }
        
        if let m = maximumIntegerDigits {
            self.maximumIntegerDigits = m
        }
    }
}
