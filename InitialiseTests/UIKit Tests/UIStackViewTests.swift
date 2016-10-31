//
//  UIStackViewTests.swift
//  Initialise
//
//  Created by Josh Campion on 18/08/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import XCTest

class UIStackViewTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInitConfiguration() {
        
        let views = [UIImageView(), UIButton(), UILabel()]
        let axis = UILayoutConstraintAxis.vertical
        let distribution = UIStackViewDistribution.equalSpacing
        let alignment = UIStackViewAlignment.leading
        let spacing:CGFloat = 8.0
        let baseline = true
        let margins = true
        let auto = true
        
        let stack = UIStackView(arrangedSubviews: views,
            axis: axis,
            distribution: distribution,
            alignment: alignment,
            spacing: spacing,
            isBaselineRelativeArrangement: baseline,
            isLayoutMarginsRelativeArrangement: margins,
            translatesAutoresizingMaskIntoConstraints: auto)
        
        XCTAssertEqual(stack.arrangedSubviews, views)
        XCTAssertEqual(stack.axis, axis)
        XCTAssertEqual(stack.distribution, distribution)
        XCTAssertEqual(stack.alignment, alignment)
        XCTAssertEqual(stack.spacing, spacing)
        XCTAssertEqual(stack.isBaselineRelativeArrangement, baseline)
        XCTAssertEqual(stack.isLayoutMarginsRelativeArrangement, margins)
        XCTAssertEqual(stack.translatesAutoresizingMaskIntoConstraints, auto)
    }
}
