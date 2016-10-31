//
//  NSDateFormatter+Initialise.swift
//  Initialise
//
//  Created by Josh Campion on 19/08/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import Foundation

/// Equatability conformance for `NSDateFormatter.DateType`. Equality is determined by equality of associated values.
public func ==(type1: DateFormatter.DateType, type2: DateFormatter.DateType) -> Bool {
    
    switch (type1, type2) {
    case (.format(let f1), .format(let f2)):
        return f1 == f2
    case (.styled(let d1, let t1), .styled(let d2, let t2)):
        return d1 == d2 && t1 == t2
    default:
        return false
    }
}

/**
 
 Extension to allow configuration through a parameter object type. As `NSDateFormatter`s can be expensive to create, `static` class level variables are a good candidate for specifying a formatter. Typically this can be done in a closure. The `NSDateFormatter.Configuration` struct allows this to be simplifier.
 
 See the [ReadMe](https://github.com/joshc89/Initialise) for examples.
 
 */
public extension DateFormatter {
    
    /**
     
     Enum representing the to mutually exclusive ways of specifying the way a date formatter converts between `NSDate`s and `String`s.
     
     - seealso: `DateFormatter.Configuration`
     - seealso: `setDateType(_:)`
     
     */
    public enum DateType: Equatable {
        
        /// Represents a String set to `dateFormat`.
        case format(String)
        
        /// Represents the `DateFormatter.Style`s assigned to `dateStyle` and `timeStyle`.
        case styled(date: DateFormatter.Style, time: DateFormatter.Style)
        
        /// Convenience creator for `.MediumStyle` date and time. 
        public static var Default = DateType.styled(date: .medium, time: .medium)
    }
    
    /// Sets either `dateFormat` or `dateStyle` and `timeStyle` based on the given `type`. This convenience setter is used in `configure(with:)`.
    public func set(dateType: DateType) {
        
        switch dateType {
        case .format(let str):
            self.dateFormat = str
        case .styled(date: let dateStyle, time: let timeStyle):
            self.dateStyle = dateStyle
            self.timeStyle = timeStyle
        }
    }
    
    /**
     
     Convenience initialiser to create a date formatter with a given set of properties.
     
     - parameter dateType: The way this formatter should convert between dates and strings. Default value is `DateType.Default`.
     - parameter locale: Default value is `.current`.
     - parameter timeZone: Default value is `.autoupdatingCurrent`.
     - parameter doesRelativeDateFormatting: Default value is `false`.
     
     */
    public convenience init(dateType: DateType = .Default,
                locale: Locale? = .current,
                timeZone: TimeZone? = .autoupdatingCurrent,
                doesRelativeDateFormatting: Bool = false) {
        
        self.init()
        
        set(dateType: dateType)
        self.locale = locale
        self.timeZone = timeZone
        self.doesRelativeDateFormatting = doesRelativeDateFormatting
    }
    
    /// Convenience creator for a `DateFormatter` to conform to the RCF 3339 standard of formatting dates.
    public static var RFC3339: DateFormatter {
        return DateFormatter(dateType: .format("yyyy-MM-dd'T'HH:mm:ssZZZZZ"),
                             locale: Locale(identifier: "en_US_POSIX"),
                             timeZone: TimeZone(secondsFromGMT: 0),
                             doesRelativeDateFormatting: false)
    }
}
