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
        let axis = UILayoutConstraintAxis.Vertical
        let distribution = UIStackViewDistribution.EqualSpacing
        let alignment = UIStackViewAlignment.Leading
        let spacing:CGFloat = 8.0
        let baseline = true
        let margins = true
        let auto = true
        
        let stack = UIStackView(configuration: UIStackView.Configuration(arrangedSubviews: views,
            axis: axis,
            distribution: distribution,
            alignment: alignment,
            spacing: spacing,
            baselineRelativeArrangement: baseline,
            layoutMarginsRelativeArrangement: margins,
            translatesAutoresizingMaskIntoConstraints: auto))
        
        XCTAssertEqual(stack.arrangedSubviews, views)
        XCTAssertEqual(stack.axis, axis)
        XCTAssertEqual(stack.distribution, distribution)
        XCTAssertEqual(stack.alignment, alignment)
        XCTAssertEqual(stack.spacing, spacing)
        XCTAssertEqual(stack.baselineRelativeArrangement, baseline)
        XCTAssertEqual(stack.layoutMarginsRelativeArrangement, margins)
        XCTAssertEqual(stack.translatesAutoresizingMaskIntoConstraints, auto)
    }
    
    func testConfigure() {
        
        let views = [UIImageView(), UIButton(), UILabel()]
        let axis = UILayoutConstraintAxis.Vertical
        let distribution = UIStackViewDistribution.EqualSpacing
        let alignment = UIStackViewAlignment.Leading
        let spacing:CGFloat = 8.0
        let baseline = true
        let margins = true
        let auto = true
        
        let config = UIStackView.Configuration(arrangedSubviews: [],
                                               axis: axis,
                                               distribution: distribution,
                                               alignment: alignment,
                                               spacing: spacing,
                                               baselineRelativeArrangement: baseline,
                                               layoutMarginsRelativeArrangement: margins,
                                               translatesAutoresizingMaskIntoConstraints: auto)
        
        let stack = UIStackView(arrangedSubviews: views)
        stack.configureWith(config)
        
        XCTAssertEqual(stack.arrangedSubviews, views)
        XCTAssertEqual(stack.axis, axis)
        XCTAssertEqual(stack.distribution, distribution)
        XCTAssertEqual(stack.alignment, alignment)
        XCTAssertEqual(stack.spacing, spacing)
        XCTAssertEqual(stack.baselineRelativeArrangement, baseline)
        XCTAssertEqual(stack.layoutMarginsRelativeArrangement, margins)
        XCTAssertEqual(stack.translatesAutoresizingMaskIntoConstraints, auto)
    }

}
