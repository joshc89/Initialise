//
//  NSDateComponentsTests.swift
//  Initialise
//
//  Created by Josh Campion on 23/08/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import XCTest

class NSDateComponentsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testComponents() {
        
        let comps = NSDateComponents(configuration: NSDateComponents.Configuration(year: 2016, month: 8, day: 23, hour: 15, minute: 33, second: 22))
        
        XCTAssertEqual(comps.year, 2016)
        XCTAssertEqual(comps.month, 8)
        XCTAssertEqual(comps.day, 23)
        
        XCTAssertEqual(comps.hour, 15)
        XCTAssertEqual(comps.minute, 33)
        XCTAssertEqual(comps.second, 22)
        
        XCTAssertNil(comps.calendar)
        XCTAssertNil(comps.timeZone)
    }
    
    func testTimeZone() {
        
        let timeZone = NSTimeZone(name: "Europe/London")
        
        let comps = NSDateComponents(configuration: NSDateComponents.Configuration(year: 2016,
            month: 8,
            day: 23,
            hour: 15,
            minute: 33,
            second: 22,
            timeZone: timeZone))
        
        XCTAssertEqual(comps.timeZone, timeZone)
        
        let GMT = NSTimeZone(forSecondsFromGMT: 0)
        
        let date = NSCalendar.currentCalendar().dateFromComponents(comps)!
        let gmtComps = NSCalendar.currentCalendar().componentsInTimeZone(GMT, fromDate: date)
        XCTAssertEqual(gmtComps.hour, 14)
    }
}
