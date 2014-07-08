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
    var view = UIView()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        view.x = 20
        println(view.x)
        super.tearDown()
    }
 
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
