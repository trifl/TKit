//
//  TKitTests.swift
//  TKitTests
//
//  Created by JP McGlone on 6/25/14.
//  Copyright (c) 2014 trifl. All rights reserved.
//

import XCTest
import TKit
import UIKit

class TKitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        let view = UIView()
        var test = ["hi", "bye"]
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        println("")

        XCTAssert(10 == 10, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
