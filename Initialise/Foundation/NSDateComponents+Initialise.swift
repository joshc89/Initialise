//
//  NSDateComponents+Initialise.swift
//  Initialise
//
//  Created by Josh Campion on 23/08/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import Foundation

/**
 
 Extension to allow configuration through a parameter object type. This allows for easier programmatic creation of [NSDateComponents].
 
 */
public extension NSDateComponents {
    
    /**
     
     Configuration Model for an `NSDateComponents`.
     
     - seealso: `NSDateComponents.init(configuration:)`
     - seealso: `NSDateComponents.configureWith(_:)`
     
     */
    struct Configuration {
        
        public let year: Int
        public let month: Int
        public let day: Int
        public let hour: Int
        public let minute: Int
        public let second: Int
        public let calendar: NSCalendar?
        public let timeZone: NSTimeZone?
        
        /**
         
         Default initialiser. Sets all the properties to be the defaults of an initialised `NSDateComponents`.
         
         - parameter year: Default value is 0.
         - parameter month: Default value is 0.
         - parameter day: Default value is 0.
         
         - parameter hour: Default value is 0.
         - parameter minute: Default value is 0.
         - parameter second: Default value is 0.
         
         - parameter calendar: Default value is `nil`.
         - parameter timeZone: Default value is `nil`.
        */
        public init(year: Int = 0,
                    month: Int = 0,
                    day: Int = 0,
                    hour: Int = 0,
                    minute: Int = 0,
                    second: Int = 0,
                    calendar: NSCalendar? = nil,
                    timeZone: NSTimeZone? = nil) {
            
            self.year = year
            self.month = month
            self.day = day
            self.hour = hour
            self.minute = minute
            self.second = second
            self.calendar = calendar
            self.timeZone = timeZone
        }
    }
    
    /**
     
     Convenience initialiser to create date components with a given set of properties.
     
     - parameter configuration: The properties to assign to the date components.
     
     */
    public convenience init(configuration: Configuration) {
        self.init()
        configureWith(configuration)
    }
    
    /**
     
     Configures the date components based on the given configuration. This is called from `init(configuration:)` after initialisation.
     
     - parameter configuration: The collection of properties to assign to these date components.
     
     */
    public func configureWith(configuration: Configuration) {
        
        self.calendar = configuration.calendar
        self.timeZone = configuration.timeZone
        
        self.year = configuration.year
        self.month = configuration.month
        self.day = configuration.day
        
        self.hour = configuration.hour
        self.minute = configuration.minute
        self.second = configuration.second
    }
}