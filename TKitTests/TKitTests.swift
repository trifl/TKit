//
//  TKitTests.swift
//  TKitTests
//
//  Created by JP McGlone on 6/25/14.
//  Copyright (c) 2014 trifl. All rights reserved.
//

import XCTest
import UIKit

class TKitTests: XCTestCase {
    var view: UIView = UIView()
    
    override func setUp() {
        super.setUp()
        view = UIView()
        
        var test = ["hi", "bye"]

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        println("")
        
        view.setX(2)
        println(view.x())
        
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
