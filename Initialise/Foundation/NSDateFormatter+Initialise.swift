//
//  NSDateFormatter+Initialise.swift
//  Initialise
//
//  Created by Josh Campion on 19/08/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import Foundation

/// Equatability conformance for `NSDateFormatter.DateType`. Equality is determined by equality of associated values.
public func ==(type1: NSDateFormatter.DateType, type2: NSDateFormatter.DateType) -> Bool {
    
    switch (type1, type2) {
    case (.Format(let f1), .Format(let f2)):
        return f1 == f2
    case (.Styled(let d1, let t1), .Styled(let d2, let t2)):
        return d1 == d2 && t1 == t2
    default:
        return false
    }
}

/**
 
 Extension to allow configuration through a parameter object type. As `NSDateFormatter`s can be expensive to create, `static` class level variables are a good candidate for specifying a formatter. Typically this can be done in a closure. The `NSDateFormatter.Configuration` allows this to be simplifier.
 
 See the [ReadMe](https://github.com/joshc89/Initialise) for examples.
 
 */
public extension NSDateFormatter {
    
    /**
     
     Enum representing the to mutually exclusive ways of specifying the way a date formatter converts between `NSDate`s and `String`s.
     
     - seealso: `NSDateFormatter.Configuration`
     - seealso: `setDateType(_:)`
     
     */
    public enum DateType: Equatable {
        
        /// Represents a String set to `dateFormat`.
        case Format(String)
        
        /// Represents the `NSDateFormatterStyle`s assigned to `dateStyle` and `timeStyle`.
        case Styled(date: NSDateFormatterStyle, time: NSDateFormatterStyle)
        
        public static var Default = DateType.Styled(date: .MediumStyle, time: .MediumStyle)
    }
    
    /// Sets either `dateFormat` or `dateStyle` and `timeStyle` based on the given `type`. This convenience setter is used in `configureWith(_:)`.
    public func setDateType(type: DateType) {
        
        switch type {
        case .Format(let str):
            self.dateFormat = str
        case .Styled(date: let dateStyle, time: let timeStyle):
            self.dateStyle = dateStyle
            self.timeStyle = timeStyle
        }
    }
    
    
    /**
     
     Configuration Model for an `NSDateFromatter`.
     
     - seealso: `UIImageView.init(configuration:)`
     - seealso: `UIImageView.configureWith(_:)`
     
     */
    public struct Configuration {
        
        /// Represents either the `NSDateFormatter`'s `dateFormat` or `dateStyle` and `timeStyle`
        public let dateType: DateType
        
        /// Represents the `NSDateFormatter`'s `locale`.
        public let locale: NSLocale
        
        /// Represents the `NSDateFormatter`'s `timeZone`.
        public let timeZone: NSTimeZone
        
        /// Represents the `NSDateFormatter`'s `doesRelativeDateFormatting`.
        public let doesRelativeDateFormatting: Bool
        
        /**
         
         Default initialiser. Sets all properties.
         
         - parameter dateType: The way this formatter should convert between dates and strings. Default value is `DateType.Default`.
         - parameter locale: Default value is `NSLocale.currentLocale()`.
         - parameter timeZone: Default value is `NSTimeZone.localTimeZone()`.
         - parameter doesRelativeDateFormatting: Default value is `false`.
         
         */
        public init(dateType: DateType = .Default,
             locale: NSLocale = NSLocale.currentLocale(),
             timeZone: NSTimeZone = NSTimeZone.localTimeZone(),
             doesRelativeDateFormatting: Bool = false) {
            
            self.dateType = dateType
            self.locale = locale
            self.timeZone = timeZone
            self.doesRelativeDateFormatting = doesRelativeDateFormatting
        }
        
        /// Configuration for an `NSDateFormatter` to conform to the RCF 3339 standard of formatting dates.
        public static var RFC3339: Configuration {
            return Configuration(dateType: .Format("yyyy-MM-dd'T'HH:mm:ssZZZZZ"),
                                 locale: NSLocale(localeIdentifier: "en_US_POSIX"),
                                 timeZone: NSTimeZone(forSecondsFromGMT: 0),
                                 doesRelativeDateFormatting: false)
        }
    }
    
    /// Convenience initialiser to programmatically create a date formatter with a given set of properties.
    public convenience init(configuration: Configuration) {
        self.init()
        self.configureWith(configuration)
    }
    
    /**
     
     Configures this date formatter based on the given configuration. This is called from `init(configuration:)` after initialisation.
     
     - parameter configuration: The collection of properties to assign to this date formatter.
     
     */
    public func configureWith(configuration: Configuration) {
        
        setDateType(configuration.dateType)
        locale = configuration.locale
        timeZone = configuration.timeZone
        doesRelativeDateFormatting = configuration.doesRelativeDateFormatting
    }
}