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
    
    let comps = DateComponents(year: 2016, month: 8, day: 23, hour: 15, minute: 33, second: 22)
    
    var date: Date {
        return Calendar.current().date(from: comps)!
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
        let type: DateFormatter.DateType = .format(format)
        let locale = Locale(localeIdentifier: "en_GB") // hh 12 hour clock
        let timeZone = TimeZone(forSecondsFromGMT: 5 * 60 * 60) // == 4 hours aheaad of BST
        
        let config = DateFormatter.Configuration(dateType: type,
                                                      locale: locale,
                                                      timeZone: timeZone)
        let formatter = DateFormatter(configuration: config)
        
        XCTAssertEqual(formatter.dateFormat, format)
        XCTAssertEqual(formatter.locale, locale)
        XCTAssertEqual(formatter.timeZone, timeZone)
        XCTAssertEqual(formatter.doesRelativeDateFormatting, false)
        
        XCTAssertEqual(formatter.string(from: date), "2016-08-23 07:33:22 pm")
    }
    
    func testInitStyledConfiguration() {
        
        let dStyle = DateFormatter.Style.longStyle
        let tStyle = DateFormatter.Style.mediumStyle
        
        let type: DateFormatter.DateType = .styled(date: dStyle, time: tStyle)
        let locale = Locale(localeIdentifier: "en_GB")
        let timeZone = TimeZone(name: "Europe/London")!
        let config = DateFormatter.Configuration(dateType: type,
                                                   locale: locale,
                                                   timeZone: timeZone)
        
        let formatter = DateFormatter(configuration: config)
        
        XCTAssertEqual(formatter.dateStyle, dStyle)
        XCTAssertEqual(formatter.timeStyle, tStyle)
        XCTAssertEqual(formatter.locale, locale)
        XCTAssertEqual(formatter.timeZone, timeZone)
        
        XCTAssertEqual(formatter.string(from: date), "23 August 2016 at 15:33:22")
    }
    
    func testRelative() {
        
        let formatter = DateFormatter(configuration: DateFormatter.Configuration(dateType: .styled(date: .longStyle, time: .noStyle),
            locale: Locale(localeIdentifier: "en_GB"),
            doesRelativeDateFormatting: true))
        
        XCTAssertEqual(formatter.doesRelativeDateFormatting, true)
        XCTAssertEqual(formatter.string(from: Date()), "Today")
    }
    
    func testConfigure() {
        
        let dStyle = DateFormatter.Style.longStyle
        let tStyle = DateFormatter.Style.mediumStyle
        
        let type: DateFormatter.DateType = .styled(date: dStyle, time: tStyle)
        let locale = Locale(localeIdentifier: "en_GB")
        let timeZone = TimeZone(forSecondsFromGMT: 5 * 60 * 60)
        let rel = true
        
        let config = DateFormatter.Configuration(dateType: type,
                                                   locale: locale,
                                                   timeZone: timeZone,
                                                   doesRelativeDateFormatting: rel)
        let formatter = DateFormatter()
        formatter.configureWith(config)
        
        XCTAssertEqual(formatter.dateStyle, dStyle)
        XCTAssertEqual(formatter.timeStyle, tStyle)
        XCTAssertEqual(formatter.locale, locale)
        XCTAssertEqual(formatter.timeZone, timeZone)
        XCTAssertEqual(formatter.doesRelativeDateFormatting, rel)

        
    }
}
