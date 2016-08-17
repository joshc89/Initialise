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

class LabelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFontConfiguration() {
        
        let font = UIFont.boldSystemFontOfSize(12)
        let color = UIColor.greenColor()
        let align = NSTextAlignment.Center
        let lines = 0
        let breakMode = NSLineBreakMode.ByWordWrapping
        let translates = true
        
        let label = UILabel(configuration: UILabel.Configuration(font: font,
            textColor: color,
            textAlignment: align,
            numberOfLines: lines,
            lineBreakMode: breakMode,
            translatesAutoresizingMaskIntoConstraints: translates))
        
        XCTAssertEqual(label.font, font)
        XCTAssertEqual(label.textColor, color)
        XCTAssertEqual(label.textAlignment, align)
        XCTAssertEqual(label.numberOfLines, lines)
        XCTAssertEqual(label.translatesAutoresizingMaskIntoConstraints, translates)
    }
    
    func testStyleConfiguration() {
        
        let style = UIFontTextStyleCaption1
        let font = UIFont.preferredFontForTextStyle(style)
        let color = UIColor.greenColor()
        let align = NSTextAlignment.Center
        let lines = 0
        let breakMode = NSLineBreakMode.ByWordWrapping
        let translates = true
        
        let label = UILabel(configuration: UILabel.Configuration(textStyle: style,
            textColor: color,
            textAlignment: align,
            numberOfLines: lines,
            lineBreakMode: breakMode,
            translatesAutoresizingMaskIntoConstraints: translates))
        
        XCTAssertEqual(label.font, font)
        XCTAssertEqual(label.textColor, color)
        XCTAssertEqual(label.textAlignment, align)
        XCTAssertEqual(label.numberOfLines, lines)
        XCTAssertEqual(label.translatesAutoresizingMaskIntoConstraints, translates)
    }
    
}
