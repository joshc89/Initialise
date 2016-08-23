//
//  LabelTests.swift
//  Initialise
//
//  Created by Josh Campion on 17/08/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import Foundation

import XCTest
import Initialise

class NSDateFormatterTests: XCTestCase {
    
    let comps = NSDateComponents(configuration: NSDateComponents.Configuration(year: 2016, month: 8, day: 23, hour: 15, minute: 33, second: 22))
    
    var date: NSDate {
        return NSCalendar.currentCalendar().dateFromComponents(comps)!
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitFormatConfiguration() {
        
        let format = "yyyy-MM-dd hh:mm:ss aa"
        let type: NSDateFormatter.DateType = .Format(format)
        let locale = NSLocale(localeIdentifier: "en_GB") // hh 12 hour clock
        let timeZone = NSTimeZone(forSecondsFromGMT: 5 * 60 * 60) // == 4 hours aheaad of BST
        
        let config = NSDateFormatter.Configuration(dateType: type,
                                                      locale: locale,
                                                      timeZone: timeZone)
        let formatter = NSDateFormatter(configuration: config)
        
        XCTAssertEqual(formatter.dateFormat, format)
        XCTAssertEqual(formatter.locale, locale)
        XCTAssertEqual(formatter.timeZone, timeZone)
        XCTAssertEqual(formatter.doesRelativeDateFormatting, false)
        
        XCTAssertEqual(formatter.stringFromDate(date), "2016-08-23 07:33:22 pm")
    }
    
    func testInitStyledConfiguration() {
        
        let dStyle = NSDateFormatterStyle.LongStyle
        let tStyle = NSDateFormatterStyle.MediumStyle
        
        let type: NSDateFormatter.DateType = .Styled(date: dStyle, time: tStyle)
        let locale = NSLocale(localeIdentifier: "en_GB")
        let timeZone = NSTimeZone(name: "Europe/London")!
        let config = NSDateFormatter.Configuration(dateType: type,
                                                   locale: locale,
                                                   timeZone: timeZone)
        
        let formatter = NSDateFormatter(configuration: config)
        
        XCTAssertEqual(formatter.dateStyle, dStyle)
        XCTAssertEqual(formatter.timeStyle, tStyle)
        XCTAssertEqual(formatter.locale, locale)
        XCTAssertEqual(formatter.timeZone, timeZone)
        
        XCTAssertEqual(formatter.stringFromDate(date), "23 August 2016 at 15:33:22")
    }
    
    func testRelative() {
        
        let formatter = NSDateFormatter(configuration: NSDateFormatter.Configuration(dateType: .Styled(date: .LongStyle, time: .NoStyle),
            locale: NSLocale(localeIdentifier: "en_GB"),
            doesRelativeDateFormatting: true))
        
        XCTAssertEqual(formatter.doesRelativeDateFormatting, true)
        XCTAssertEqual(formatter.stringFromDate(NSDate()), "Today")
    }
    
    func testConfigure() {
        
        let dStyle = NSDateFormatterStyle.LongStyle
        let tStyle = NSDateFormatterStyle.MediumStyle
        
        let type: NSDateFormatter.DateType = .Styled(date: dStyle, time: tStyle)
        let locale = NSLocale(localeIdentifier: "en_GB")
        let timeZone = NSTimeZone(forSecondsFromGMT: 5 * 60 * 60)
        let rel = true
        
        let config = NSDateFormatter.Configuration(dateType: type,
                                                   locale: locale,
                                                   timeZone: timeZone,
                                                   doesRelativeDateFormatting: rel)
        let formatter = NSDateFormatter()
        formatter.configureWith(config)
        
        XCTAssertEqual(formatter.dateStyle, dStyle)
        XCTAssertEqual(formatter.timeStyle, tStyle)
        XCTAssertEqual(formatter.locale, locale)
        XCTAssertEqual(formatter.timeZone, timeZone)
        XCTAssertEqual(formatter.doesRelativeDateFormatting, rel)

        
    }
}
