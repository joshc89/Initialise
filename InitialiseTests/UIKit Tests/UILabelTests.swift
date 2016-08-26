//
//  UILabelTests.swift
//  Initialise
//
//  Created by Josh Campion on 17/08/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import Foundation

import XCTest
import Initialise

class UILabelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitFontConfiguration() {
        
        let font = UIFont.boldSystemFont(ofSize: 12)
        let color = UIColor.green
        let align = NSTextAlignment.center
        let lines = 0
        let breakMode = NSLineBreakMode.byWordWrapping
        let translates = true
        
        let label = UILabel(configuration: .init(text: nil,
            font: font,
            textColor: color,
            textAlignment: align,
            numberOfLines: lines,
            lineBreakMode: breakMode,
            translatesAutoresizingMaskIntoConstraints: translates))
        
        XCTAssertEqual(label.font, font)
        XCTAssertEqual(label.textColor, color)
        XCTAssertEqual(label.textAlignment, align)
        XCTAssertEqual(label.numberOfLines, lines)
        XCTAssertEqual(label.lineBreakMode, breakMode)
        XCTAssertEqual(label.translatesAutoresizingMaskIntoConstraints, translates)
    }
    
    func testInitStyleConfiguration() {
        
        let style = UIFontTextStyle.caption1
        let font = UIFont.preferredFont(forTextStyle: style)
        let color = UIColor.green
        let align = NSTextAlignment.center
        let lines = 0
        let breakMode = NSLineBreakMode.byWordWrapping
        let translates = true
        
        let label = UILabel(configuration: .init(textStyle: style,
            textColor: color,
            textAlignment: align,
            numberOfLines: lines,
            lineBreakMode: breakMode,
            translatesAutoresizingMaskIntoConstraints: translates))
        
        XCTAssertEqual(label.font, font)
        XCTAssertEqual(label.textColor, color)
        XCTAssertEqual(label.textAlignment, align)
        XCTAssertEqual(label.numberOfLines, lines)
        XCTAssertEqual(label.lineBreakMode, breakMode)
        XCTAssertEqual(label.translatesAutoresizingMaskIntoConstraints, translates)
    }
    
    func testConfigure() {
        
        let style = UIFontTextStyle.caption1
        let font = UIFont.preferredFont(forTextStyle: style)
        let color = UIColor.green
        let align = NSTextAlignment.center
        let lines = 0
        let breakMode = NSLineBreakMode.byWordWrapping
        let translates = true
        
        let label = UILabel()
        label.configure(with: .init(textStyle: style,
            textColor: color,
            textAlignment: align,
            numberOfLines: lines,
            lineBreakMode: breakMode,
            translatesAutoresizingMaskIntoConstraints: translates))
        
        XCTAssertEqual(label.font, font)
        XCTAssertEqual(label.textColor, color)
        XCTAssertEqual(label.textAlignment, align)
        XCTAssertEqual(label.numberOfLines, lines)
        XCTAssertEqual(label.lineBreakMode, breakMode)
        XCTAssertEqual(label.translatesAutoresizingMaskIntoConstraints, translates)
    }
    
    func testPlainText() {
        
        let str = "Hello World"
        let label = UILabel(configuration: .init(text: .plain(str)))
        
        XCTAssertEqual(label.text, str)
    }
    
    func testAttributedAtext() {
        
        let attribs = [
            NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption1),
            NSForegroundColorAttributeName: UIColor.red]
        let str = NSAttributedString(string: "Hello World", attributes: attribs)
        
        let label = UILabel(configuration: .init(text: .attributed(str)))
        
        XCTAssertEqual(label.attributedText, str)
    }
}
