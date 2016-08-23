//
//  NSNumberFormatterTests.swift
//  Initialise
//
//  Created by Josh Campion on 23/08/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import XCTest
import Initialise

class NSNumberFormatterTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCurrency() {
        
        let formatter = NSNumberFormatter(configuration: NSNumberFormatter.Configuration(numberStyle: .CurrencyStyle,
            locale: NSLocale(localeIdentifier: "en_GB")))
        
        XCTAssertEqual(formatter.stringFromNumber(12.35), "£12.35")
        
        let formatter2 = NSNumberFormatter(configuration: NSNumberFormatter.Configuration(numberStyle: .CurrencyStyle,
            locale: NSLocale(localeIdentifier: "en_GB"),
            minimumFractionDigits: 0,
            maximumFractionDigits: 0))
        
        XCTAssertEqual(formatter2.stringFromNumber(12.35), "£12")
        XCTAssertEqual(formatter2.stringFromNumber(12.78), "£13")
    }
    
    func testFractions() {
        
        let formatter2 = NSNumberFormatter(configuration: NSNumberFormatter.Configuration(numberStyle: .CurrencyStyle,
            locale: NSLocale(localeIdentifier: "en_GB"),
            minimumFractionDigits: 0,
            maximumFractionDigits: 0))
        
        XCTAssertEqual(formatter2.stringFromNumber(12.35), "£12")
        XCTAssertEqual(formatter2.stringFromNumber(12.78), "£13")
    }
    
    func testSignificant() {
        
        let formatter2 = NSNumberFormatter(configuration: NSNumberFormatter.Configuration(numberStyle: .CurrencyStyle,
            locale: NSLocale(localeIdentifier: "en_GB"),
            minimumSignificantDigits: 0,
            maximumSignificantDigits: 4))
        
        XCTAssertEqual(formatter2.stringFromNumber(12.35), "£12.35")
        XCTAssertEqual(formatter2.stringFromNumber(1222.78), "£1,223")
        XCTAssertEqual(formatter2.stringFromNumber(1222280), "£1,222,000")
    }
    
    func testInteger() {
        
        let formatter = NSNumberFormatter(configuration: NSNumberFormatter.Configuration(numberStyle: .DecimalStyle,
            minimumIntegerDigits: 3,
            maximumIntegerDigits: 5))
        
        XCTAssertEqual(formatter.stringFromNumber(12), "012")
        XCTAssertEqual(formatter.stringFromNumber(123456), "23,456")
        
    }
}
