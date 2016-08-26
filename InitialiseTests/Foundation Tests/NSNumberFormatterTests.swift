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
        
        let formatter = NumberFormatter(numberStyle: .currency,
            locale: Locale(identifier: "en_GB"))
        
        XCTAssertEqual(formatter.string(from: 12.35), "£12.35")
        
        let formatter2 = NumberFormatter(numberStyle: .currency,
            locale: Locale(identifier: "en_GB"),
            minimumFractionDigits: 0,
            maximumFractionDigits: 0)
        
        XCTAssertEqual(formatter2.string(from: 12.35), "£12")
        XCTAssertEqual(formatter2.string(from: 12.78), "£13")
    }
    
    func testFractions() {
        
        let formatter2 = NumberFormatter(numberStyle: .currency,
            locale: Locale(identifier: "en_GB"),
            minimumFractionDigits: 0,
            maximumFractionDigits: 0)
        
        XCTAssertEqual(formatter2.string(from: 12.35), "£12")
        XCTAssertEqual(formatter2.string(from: 12.78), "£13")
    }
    
    func testSignificant() {
        
        let formatter2 = NumberFormatter(numberStyle: .currency,
            locale: Locale(identifier: "en_GB"),
            minimumSignificantDigits: 0,
            maximumSignificantDigits: 4)
        
        XCTAssertEqual(formatter2.string(from: 12.35), "£12.35")
        XCTAssertEqual(formatter2.string(from: 1222.78), "£1,223")
        XCTAssertEqual(formatter2.string(from: 1222280), "£1,222,000")
    }
    
    func testInteger() {
        
        let formatter = NumberFormatter(numberStyle: .decimal,
            minimumIntegerDigits: 3,
            maximumIntegerDigits: 5)
        
        XCTAssertEqual(formatter.string(from: 12), "012")
        XCTAssertEqual(formatter.string(from: 123456), "23,456")
        
    }
}
