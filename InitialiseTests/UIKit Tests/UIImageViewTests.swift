//
//  UIImageViewTests.swift
//  Initialise
//
//  Created by Josh Campion on 18/08/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import XCTest

import Initialise

class UIImageViewTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInitConfiguration() {
        
        let image = UIImage(named: "ic_phone_iphone")
        let mode = UIViewContentMode.scaleAspectFit
        let bg = UIColor(white: 0.95, alpha: 1.0)
        let opaque = false
        let auto = true
        
        
        let iv = UIImageView(configuration: .init(image: image,
                                                  contentMode: mode,
                                                  backgroundColor: bg,
                                                  isOpaque: opaque,
                                                  translatesAutoresizingMaskIntoConstraints: auto))
        
        XCTAssertEqual(iv.image, image)
        XCTAssertEqual(iv.contentMode, mode)
        XCTAssertEqual(iv.backgroundColor, bg)
        XCTAssertEqual(iv.isOpaque, opaque)
        XCTAssertEqual(iv.translatesAutoresizingMaskIntoConstraints, auto)
    }
    
    func testConfigure() {
        
        let image = UIImage(named: "ic_phone_iphone")
        let mode = UIViewContentMode.scaleAspectFit
        let bg = UIColor(white: 0.95, alpha: 1.0)
        let opaque = false
        let auto = true
        
        let testConfiguration = UIImageView.Configuration(image: image,
                                                          contentMode: mode,
                                                          backgroundColor: bg,
                                                          isOpaque: opaque,
                                                          translatesAutoresizingMaskIntoConstraints: auto)
        
        let iv = UIImageView()
        iv.configure(with: testConfiguration)
        
        XCTAssertEqual(iv.image, image)
        XCTAssertEqual(iv.contentMode, mode)
        XCTAssertEqual(iv.backgroundColor, bg)
        XCTAssertEqual(iv.isOpaque, opaque)
        XCTAssertEqual(iv.translatesAutoresizingMaskIntoConstraints, auto)
    }

}
